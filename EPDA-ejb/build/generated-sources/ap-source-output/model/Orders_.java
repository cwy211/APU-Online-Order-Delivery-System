package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Delivery;
import model.Order_Product;
import model.Pickup;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T17:53:53")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Delivery> delivery;
    public static volatile SingularAttribute<Orders, Double> amount;
    public static volatile SingularAttribute<Orders, String> orderTime;
    public static volatile SingularAttribute<Orders, Pickup> pickup;
    public static volatile SingularAttribute<Orders, Long> id;
    public static volatile ListAttribute<Orders, Order_Product> orderProduct;
    public static volatile SingularAttribute<Orders, Character> type;
    public static volatile SingularAttribute<Orders, Customer> customer;

}