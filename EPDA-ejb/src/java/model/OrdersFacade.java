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
public class OrdersFacade extends AbstractFacade<Orders> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }
    
    public Orders findOrderByDelivery(Delivery delivery){
        List<Orders> orderList = this.findAll();
        for(Orders orders : orderList){
            if(orders.getType()=="delivery".charAt(0)){
                if(orders.getDelivery().getId()==delivery.getId()){
                return orders;
            }
            }
            
        }
        return null;
    }
    
    public Orders findOrderByPickup(Pickup pickup){
        List<Orders> orderList = this.findAll();
        for(Orders orders : orderList){
            if(orders.getType()=="pickup".charAt(0)){
                if(orders.getPickup().getId()==pickup.getId()){
                return orders;
            }
            }
            
        }
        return null;
    }
    
    public List <Orders> findOrdersByCustomer(Customer customer){
        List<Orders> orderList = this.findAll();
        List<Orders> filteredOrderList = new ArrayList<Orders>();
        for(Orders orders : orderList){
            if(orders.getCustomer().getId()==customer.getId()){
                filteredOrderList.add(orders);
                  
            }
            
        }
        return filteredOrderList;
    }
    
    public List <Orders> findPendingOrders(Customer customer){
        List<Orders> orderList = this.findOrdersByCustomer(customer);
        List<Orders> filteredOrderList = new ArrayList<Orders>();
        for(Orders orders : orderList){
            if(orders.getType()=="pickup".charAt(0)){
                if(orders.getPickup().getStatus()!="done".charAt(0)){
                    filteredOrderList.add(orders);
                }     
            }else{
                if(orders.getDelivery().getStatus()!="arrived".charAt(0)){
                    filteredOrderList.add(orders);
                } 
            }
            
        }
        return filteredOrderList;
    }
    
    public List <Orders> findCompletedOrders(){
        List<Orders> orderList = this.findAll();
        List<Orders> filteredOrderList = new ArrayList<Orders>();
        for(Orders orders : orderList){
            if(orders.getType()=="pickup".charAt(0)){
                if(orders.getPickup().getStatus()=="done".charAt(0)){
                    filteredOrderList.add(orders);
                }     
            }else{
                if(orders.getDelivery().getStatus()=="arrived".charAt(0)){
                    filteredOrderList.add(orders);
                } 
            }
            
        }
        return filteredOrderList;
    }
    
}
