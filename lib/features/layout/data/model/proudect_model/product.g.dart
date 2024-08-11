
// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'product.dart';
// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductItemModelAdapter extends TypeAdapter<ProductItemModel> {
  @override
  final int typeId = 0;

  @override
  ProductItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItemModel(
      id: fields[0] as int?,
      price: fields[1] as double?,
      oldPrice: fields[2] as double?,
      discount: fields[3] as int?,
      image: fields[4] as String?,
      name: fields[5] as String?,
      description: fields[6] as String?,
      images: (fields[7] as List?)?.cast<dynamic>(),
      inFavorites: fields[8] as bool?,
      inCart: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.oldPrice)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.inFavorites)
      ..writeByte(9)
      ..write(obj.inCart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductItemModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
