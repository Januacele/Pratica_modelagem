CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"categoryId" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"imageUrlFront" TEXT NOT NULL,
	"imageUrlBack" TEXT NOT NULL,
	"imageUrlLeftSize" TEXT NOT NULL,
	"imageUrlRigthSize" TEXT NOT NULL,
	"imageUrlFrontBack" TEXT NOT NULL,
	"size" char(1) NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productMainImage" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"imageUrl" serial NOT NULL,
	CONSTRAINT "productMainImage_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.buy" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"productId" serial NOT NULL,
	"addressId" int NOT NULL,
	"dateBuy" TIMESTAMP NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'criada',
	CONSTRAINT "buy_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"categoryName" serial NOT NULL,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.city" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"country" TEXT NOT NULL DEFAULT 'Brazil',
	"state" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	CONSTRAINT "city_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"cityId" serial NOT NULL,
	"street" TEXT NOT NULL,
	"homeNumber" int NOT NULL,
	"cep" int(8) NOT NULL,
	"closeTo" TEXT NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");

ALTER TABLE "productMainImage" ADD CONSTRAINT "productMainImage_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "buy" ADD CONSTRAINT "buy_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "buy" ADD CONSTRAINT "buy_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "buy" ADD CONSTRAINT "buy_fk2" FOREIGN KEY ("addressId") REFERENCES "address"("id");


ALTER TABLE "city" ADD CONSTRAINT "city_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("cityId") REFERENCES "city"("id");








