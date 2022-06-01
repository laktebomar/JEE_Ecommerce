package com.example.examplejee;

public class Product {
        private String name, description, uname;
        private int price, quantity, id;

        public Product(int id, String name, String description, String uname, int price, int quantity) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.uname = uname;
            this.price = price;
            this.quantity = quantity;
        }
        public Product(String name, String description, int price, int quantity) {
            this.name = name;
            this.description = description;
            this.price = price;
            this.quantity = quantity;
        }

    public int getId() {
        return id;
    }

    public String getName() {
            return name;
        }

        public String getDescription() {
            return description;
        }


        public int getPrice() {
            return price;
        }

        public int getQuantity() {
            return quantity;
        }

        public String getUname() {
            return uname;
        }
}
