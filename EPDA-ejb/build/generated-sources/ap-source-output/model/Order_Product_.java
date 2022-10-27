package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orders;
import model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T17:53:53")
@StaticMetamodel(Order_Product.class)
public class Order_Product_ { 

    public static volatile SingularAttribute<Order_Product, Product> product;
    public static volatile SingularAttribute<Order_Product, Orders> mainOrder;
    public static volatile SingularAttribute<Order_Product, Integer> quantity;
    public static volatile SingularAttribute<Order_Product, Long> id;

}