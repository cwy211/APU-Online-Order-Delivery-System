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
public class StaffFacade extends AbstractFacade<Staff> {

    @PersistenceContext(unitName = "EPDA-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StaffFacade() {
        super(Staff.class);
    }
    
    public List<Staff> getAvailableDeliveryStaffs(){
        List<Staff> stafflist = this.findAll();
        List<Staff> filteredStafflist = new ArrayList<Staff>();
        for(Staff staff:stafflist){
            if(staff.getStatus()!="assigned".charAt(0)&&staff.getRole()=="d".charAt(0)){
                filteredStafflist.add(staff);
            }
        }
        return filteredStafflist;
    }
    
    public int getStaffGenderNumber(char gender){
        List<Staff> stafflist = this.findAll();
        int genderCount=0;
        for(Staff staff:stafflist){
            if(staff.getGender()==gender){
                genderCount++;
            }
        }
        return genderCount;
    }
    
    @Override
    public List<Staff> findAll(){
        List<Staff> staffList = super.findAll();
        List<Staff> activeStaffList = new ArrayList<Staff>();
        for(Staff staff : staffList){
            if(staff.getStatus()!="deleted".charAt(0)){
                activeStaffList.add(staff);
            }
        }
        return activeStaffList;
    }
}
