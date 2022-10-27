package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T17:53:53")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Integer> quantity;
    public static volatile SingularAttribute<Product, Long> id;
    public static volatile SingularAttribute<Product, String> productName;
    public static volatile SingularAttribute<Product, Double> productPrice;
    public static volatile SingularAttribute<Product, String> manufacturer;
    public static volatile SingularAttribute<Product, Character> status;

}