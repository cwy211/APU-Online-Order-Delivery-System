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
public class CustomerFacade extends AbstractFacade<Customer> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerFacade() {
        super(Customer.class);
    }
    
    public int getCustomerGenderNumber(char gender){
        List<Customer> customerlist = this.findAll();
        int genderCount=0;
        for(Customer customer:customerlist){
            if(customer.getGender()==gender){
                genderCount++;
            }
        }
        return genderCount;
    }
    
    @Override
    public List<Customer> findAll(){
        List<Customer> customerList = super.findAll();
        List<Customer> activeCustomerList = new ArrayList<Customer>();
        for(Customer customer : customerList){
            if(customer.getStatus()=="active".charAt(0)){
                activeCustomerList.add(customer);
            }
        }
        return activeCustomerList;
    }
    
    
}
