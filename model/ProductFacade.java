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
public class ProductFacade extends AbstractFacade<Product> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }
    
    public Product getByProductName(String productName){
        List<Product> productlist = super.findAll();
        for(Product product:productlist){
            if(product.getProductName().equalsIgnoreCase(productName)){
                return product;
            }
        }
        return null;
    }
    
    @Override
    public List<Product> findAll(){
        List<Product> productList = super.findAll();
        List<Product> activeProductList = new ArrayList<Product>();
        for(Product product : productList){
            if(product.getStatus()=="active".charAt(0)){
                activeProductList.add(product);
            }
        }
        return activeProductList;
    }
            
    
}
