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
public class PickupFacade extends AbstractFacade<Pickup> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PickupFacade() {
        super(Pickup.class);
    }
    
    public List<Pickup> findAll(){
        List<Pickup> pickupList = super.findAll();
        List<Pickup> activePickupList = new ArrayList<Pickup>();
        for(Pickup pickup : pickupList){
            if(pickup.getStatus()!="cancelled".charAt(0)){
                activePickupList.add(pickup);
            }
        }
        return activePickupList;
    }
}
