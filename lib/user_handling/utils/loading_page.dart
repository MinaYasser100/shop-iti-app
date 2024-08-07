import 'dart:async';
import 'package:flutter/material.dart';


class _LoadingScreenController {
  final bool Function() close;
  final bool Function(String text) update;

  const _LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class LoadingScreen {
  BuildContext? _context;
  String Function(BuildContext context) textCallback = (_) => "Loading...";
  Color barrierColor = Colors.black.withAlpha(150);

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;

  final _changeWithInertia = ChangeWithInertia<bool>(
    initialValue: false,
    valueInertiaMap: {false: 1, true: 3.5,},
    inertiaUnitDuration: const Duration(milliseconds: 200,),
  );

  int _lastCode = -1;
  int getCode() => ++_lastCode;

  final _activeCodes = <int>{};


  LoadingScreen._sharedInstance(){
    _changeWithInertia.addListener(() {
      if(_changeWithInertia.currentValue){
        if(_context != null){
          _updateOrShow(context: _context!, text: textCallback(_context!),);
        }
      }else{
        _hide();
      }
    });
  }

  _LoadingScreenController? _controller;

  bool get isActive => _controller != null;

  void show(BuildContext context, int code,){
    _activeCodes.add(code);

    _context = context;
    _changeWithInertia.requestChange(true);
  }

  void hide(int code) {
    _activeCodes.remove(code);

    if(_activeCodes.isEmpty){
      forcedHide();
    }
  }

  void forcedHide(){
    _activeCodes.clear();
    _changeWithInertia.requestChange(false);
  }

  void _updateOrShow({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else if(context.mounted) {
      _controller = _showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void _hide() {
    _controller?.close();
    _controller = null;
  }

  _LoadingScreenController _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final textStream = StreamController<String>();
    textStream.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: barrierColor,
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x13000000),
                    blurRadius: 12.0, // soften the shadow
                    spreadRadius: 4.0, //extend the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      StreamBuilder(
                        stream: textStream.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final str = snapshot.data as String;
                            return str.isNotEmpty ? Text(
                              str,
                              textAlign: TextAlign.center,
                            ) : const SizedBox.shrink();
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return _LoadingScreenController(
      close: () {
        textStream.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        textStream.add(text);
        return true;
      },
    );
  }
}


class ChangeWithInertia<T>{
  final double defaultInertia;
  Duration _inertiaUnitDuration;

  final Map<T, double> _valueInertiaMap;

  T _current;
  T get currentValue => _current;

  T? _requestedValue;
  Timer? _request;

  final _notifier = ValueNotifier<bool>(false);


  ChangeWithInertia({
    required T initialValue,
    Map<T, double> valueInertiaMap = const {},
    this.defaultInertia = 0,
    Duration inertiaUnitDuration = const Duration(milliseconds: 200,),
  }) : _valueInertiaMap = valueInertiaMap,
        _current = initialValue,
        _inertiaUnitDuration = inertiaUnitDuration;

  void requestChange(T newValue){
    if(newValue == _requestedValue){return;}

    if(newValue == _current){
      _request?.cancel();
      _request = null;
      _requestedValue = null;
      return;
    }

    _request?.cancel();

    _requestedValue = newValue;
    _request = Timer(_getValueDuration(_current), (){
      _current = _requestedValue as T;
      _request = null;
      _requestedValue = null;
      _notify();
    });
  }

  void forcedChange(T newValue, [bool alwaysNotify = false]){
    _request?.cancel();
    _request = null;
    _requestedValue = null;

    final wasEqual = (_current == newValue);
    _current = newValue;

    if(alwaysNotify || !wasEqual) {_notify();}
  }

  void addListener(void Function() listener) => _notifier.addListener(listener);

  void removeListener(void Function() listener) => _notifier.removeListener(listener);

  void _notify() => _notifier.value = !_notifier.value;

  Duration _getValueDuration(T value) => _inertiaUnitDuration * (_valueInertiaMap[value] ?? defaultInertia);

  void changeInertiaUnitDuration(Duration duration) => _inertiaUnitDuration = duration;
}
