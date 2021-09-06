// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************
// TypeAdapterGenerator
// **************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
        id: fields[0] as String,
        name: fields[1] as String,
        description: fields[2] as String,
        imgUrl: fields[3] as String,
        imgUrl1: fields[4] as String,
        imgUrl2: fields[5] as String,
        price: fields[6] as int,
        discount: fields[7] as int,
        category: fields[8] as String,
        carId: fields[9] as String,
        available: fields[10] as bool,
        stock: fields[11] as int,
        weightInKg: fields[12] as String,
        createdAt: fields[13] as String,
        updatedAt: fields[14] as String,
        modelId: fields[15] as int,
        makerId: fields[16] as int,
        brandId: fields[17] as String,
        year: fields[18] as String,);
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.imgUrl)
      ..writeByte(4)
      ..write(obj.imgUrl1)
      ..writeByte(5)
      ..write(obj.imgUrl2)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.discount)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.carId)
      ..writeByte(10)
      ..write(obj.available)
      ..writeByte(11)
      ..write(obj.stock)
      ..writeByte(12)
      ..write(obj.weightInKg)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.modelId)
      ..writeByte(16)
      ..write(obj.makerId)
      ..writeByte(17)
      ..write(obj.brandId)
      ..writeByte(18)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
