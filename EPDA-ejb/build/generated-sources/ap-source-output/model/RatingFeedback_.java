package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orders;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-04T17:53:53")
@StaticMetamodel(RatingFeedback.class)
public class RatingFeedback_ { 

    public static volatile SingularAttribute<RatingFeedback, String> feedback;
    public static volatile SingularAttribute<RatingFeedback, Integer> rating;
    public static volatile SingularAttribute<RatingFeedback, Long> id;
    public static volatile SingularAttribute<RatingFeedback, Orders> order;

}