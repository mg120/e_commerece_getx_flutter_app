class ProductModel{
   String name;
   String description;
   String image;
   String color;
   String size;
   String price;

  ProductModel(this.name, this.description, this.image, this.color, this.size, this.price);

   ProductModel.fromJson(Map<String, dynamic> map){
     if(map == null){
       return;
     }
     name = map['name'];
     description = map['description'];
     image = map['image'];
     color = map['color'];
     size = map['size'];
     price = map['price'];
   }

   toJson(){
     return{
       'name' : name,
       'description' : description,
       'image' : image,
       'color' : color,
       'size' : size,
       'price' : price,
     };
   }
}