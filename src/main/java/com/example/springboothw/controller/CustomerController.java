package com.example.springboothw.controller;

import com.example.springboothw.model.Customer;
import com.example.springboothw.model.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController

public class CustomerController {
    @Autowired
    private CustomerRepository customerRepository;
    @RequestMapping(value = "/")
    public ModelAndView index(){
        return new ModelAndView("index");
    }

    @PostMapping(path="/customer") // Map ONLY POST Requests
    public String addNewCustomer (@RequestParam String firstname, @RequestParam String lastname) {
    // @ResponseBody means the returned String is the response, not a view name
    // @RequestParam means it is a parameter from the GET or POST request
        Customer n = new Customer(firstname, lastname);
        customerRepository.save(n);
        return n.toString();
    }
    @GetMapping(path="/customers")
    public  Iterable<Customer> getAllCustomer() {
    // This returns a JSON or XML with the users
        return customerRepository.findAll();
    }
    @GetMapping(path = "/customer")
    public  String getoneCustomer(@RequestParam long id){
        try {
            Customer c1= customerRepository.findById(id);
            return  c1.toString();
        }catch (Exception e) {
            return "Customer not found";
        }
    }
    @PutMapping(path="/customer")
    public  String updateCustomer(@RequestParam long id ,@RequestParam String firstname, @RequestParam String lastname)  {
        try {
            Customer c1= customerRepository.findById(id);
            c1.setFirstName(firstname);
            c1.setLastName(lastname);
            customerRepository.save(c1);
        }catch (Exception e) {
            return "Customer not found";
        }
        return  "update";
    }
    @DeleteMapping(path="/customer/{id}")
    public  String deleteCustomer(@RequestParam long id){
        try {
            customerRepository.deleteById(id);
        }catch (Exception e) {
            return "Customer not found";
        }
        return  "delete";
    }
    @GetMapping(path="/customer/delete/{id}")
    public  String fakedeleteCustomer(@RequestParam long id){
        try {
            customerRepository.deleteById(id);
        }catch (Exception e) {
            return "Customer not found";
        }
        return  "delete";
    }
    @PostMapping(path="/customer/update")
    public  String fakeupdateCustomer(@RequestParam long id ,@RequestParam String firstname, @RequestParam String lastname)  {
        try {
            Customer c1= customerRepository.findById(id);
            c1.setFirstName(firstname);
            c1.setLastName(lastname);
            customerRepository.save(c1);
        }catch (Exception e) {
            return "Customer not found";
        }
        return  "update";
    }

}