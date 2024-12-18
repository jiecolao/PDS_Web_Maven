package com.pds_web_maven.dao;

import com.pds_web_maven.entities.contact_info;
import com.pds_web_maven.entities.family_background;
import com.pds_web_maven.entities.family_children;
import com.pds_web_maven.entities.personal_info;
import java.util.List;
import java.util.Map;

public class Main {
    
    public static void main(String[] args){
        // TODO: HibernateUtil.xml (improv)
        //       bukod sa age, include narin yung birthdate
        //       NamedQueries
        //       error catching for crud
        //       query for ref values
        //       null for ext values?
        //       lagay ext value sa fam bg
        //       counter columns are not update-able
        //       DB: add DELETE CASCADE on create script
        //       DB: add ext_name in inserts
        
        Personal_infoDAO ePI = new Personal_infoDAO();
        List<Map<String, String>> abc = ePI.getData();
        
        Family_backgroundDAO eFB = new Family_backgroundDAO();
        List<Map<String, String>> def = eFB.getData();
        
        Family_childrenDAO eFC = new Family_childrenDAO();
        List<Map<String, String>> hij = eFC.getChildren(62);
        
        Contact_infoDAO eCI = new Contact_infoDAO();
        List<Map<String, String>> zx = eCI.getData();
        
        personal_info clPI = new personal_info("69", "1", "1", "2", "1", 
                "CruzZZ", "JANSSEN", "Miguel", null, "1997-05-15", "Cebu", 
                "175", "68", "O+", "100000060", "10000060", 
                "100060", "160", "060", "10060");
        contact_info clCI = new contact_info("69", "160", "BeachesS St", "Sunset Shores",
                "Brgy. Cebu", "CebuU City", "Cebu", "6000", "160", 
                "Beach St", "Sunset Shoes", "Brgy. Cebu", "Cebu City", "Cebu", 
                "6000", "(02) 123-45660", "0917-123-4560", "jon.cruz@email.com");
        family_background clFB = new family_background("65", "69", 
                "TESTTT", "TEST", "Ibo", "Jr.", null, null, null, 
                "Cruz", "Ramon", "Lois", null, "Miguel", "Gloria", "Bautista");
        family_children clFC = new family_children("72", "69", "TEST", "2029-03-20");
        
//        ePI.addData(clPI);
//        eCI.addData(clCI);
//        eFB.addData(clFB);
//        eFC.addData(clFC);
//        ePI.deleteEverything(68);
//        ePI.updatePersonalInfo(clPI, clCI);
        eFB.updateFamilyBackground(clFB, clFC);
//        System.out.println(clFB.getSpouseLname());
        
        // DEBUGGER
        for (Map<String, String> map : def) {
//           System.out.println(map.get("spouse_lname"));
        }
    }
}