package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Staff;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T17:53:53")
@StaticMetamodel(Delivery.class)
public class Delivery_ { 

    public static volatile SingularAttribute<Delivery, String> address;
    public static volatile SingularAttribute<Delivery, String> arrivalTime;
    public static volatile SingularAttribute<Delivery, Staff> staff;
    public static volatile SingularAttribute<Delivery, Long> id;
    public static volatile SingularAttribute<Delivery, Character> status;

}