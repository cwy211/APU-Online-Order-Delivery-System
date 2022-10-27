/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cwy
 */
@Stateless
public class RatingFeedbackFacade extends AbstractFacade<RatingFeedback> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RatingFeedbackFacade() {
        super(RatingFeedback.class);
    }
    
    public RatingFeedback findRatingFeedbackByOrder(Orders order){
        List<RatingFeedback> ratingFeedbackList = this.findAll();
        for(RatingFeedback ratingFeedback: ratingFeedbackList){
            if(ratingFeedback.getOrder().getId()==order.getId()){
                return ratingFeedback;
            }
        }
        return null;
    }
    
    public List<RatingFeedback> findRatingFeedbackByCustomerId(Customer customer){
        List<RatingFeedback> ratingFeedbackList = this.findAll();
        List<RatingFeedback> filteredRatingFeedbackList = new ArrayList<RatingFeedback>();
        for(RatingFeedback ratingFeedback: ratingFeedbackList){
            if(ratingFeedback.getOrder().getCustomer().getId()==customer.getId()){
                filteredRatingFeedbackList.add(ratingFeedback);
            }
        }
        return filteredRatingFeedbackList;
    }
    
    public double getAverageRatings(){
        List<RatingFeedback> ratingFeedbackList = this.findAll();
        int ratingSum=0;
        int ratingCounter=0;
        for(RatingFeedback ratingFeedback: ratingFeedbackList){
            ratingSum=ratingSum+ratingFeedback.getRating();
            ratingCounter++;
        }
        double avarageRating = ((double)ratingSum/ratingCounter);
        return avarageRating;
    }
    
}
