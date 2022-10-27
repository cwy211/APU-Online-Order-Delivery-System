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
public class Order_ProductFacade extends AbstractFacade<Order_Product> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Order_ProductFacade() {
        super(Order_Product.class);
    }
    
    public List<Order_Product> findOrderProductByOrder(Orders orders){
        List<Order_Product> orderProductList = this.findAll();
        List<Order_Product> filteredOrderProductList = new ArrayList<Order_Product>();
        for(Order_Product orderProduct : orderProductList){
            if(orderProduct.getMainOrder().getId()==orders.getId()){
                filteredOrderProductList.add(orderProduct);
            }
        }
        return filteredOrderProductList;
    }
    
    public int getProductAmountbyProduct(Product product){
        List<Order_Product> orderProductList = this.findAll();
        int amount=0;
        for(Order_Product orderProduct : orderProductList){
            if(orderProduct.getProduct().getId()==product.getId()){
                amount=amount+orderProduct.getQuantity();
            }
        }
        return amount;
    }
    
}
