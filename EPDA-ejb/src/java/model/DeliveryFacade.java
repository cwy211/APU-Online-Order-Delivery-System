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
public class DeliveryFacade extends AbstractFacade<Delivery> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DeliveryFacade() {
        super(Delivery.class);
    }
    
    public List<Delivery> findByStaffId(String staffId){
        List<Delivery> deliveryList = this.findAll();
        List<Delivery> filteredDeliveryList = new ArrayList<Delivery>();
        for(Delivery delivery:deliveryList){
            if(delivery.getStaff()!=null){
                if(delivery.getStaff().getId().equals(staffId)){
                    filteredDeliveryList.add(delivery);
                }
            }
        }
        return filteredDeliveryList;
    }
    
    public Delivery findActiveDeliveryByStaffId(String staffId){
        List<Delivery> deliveryList = this.findByStaffId(staffId);
        if(deliveryList!=null){
            for(Delivery delivery:deliveryList){
                if(delivery.getStatus()=="delivering".charAt(0)){
                    return delivery;
                }
            }
        }

        return null;
    }
    
    public List<Delivery> findAll(){
        List<Delivery> deliveryList = super.findAll();
        List<Delivery> activeDeliveryList = new ArrayList<Delivery>();
        for(Delivery delivery : deliveryList){
            if(delivery.getStatus()!="cancel".charAt(0)){
                activeDeliveryList.add(delivery);
            }
        }
        return activeDeliveryList;
    }
}
