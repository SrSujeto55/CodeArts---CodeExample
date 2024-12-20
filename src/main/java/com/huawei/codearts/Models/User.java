package com.huawei.codearts.Models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer Id;

    @Setter @Getter
    private String name;

    @Setter @Getter
    private int age;

    @Setter @Getter
    private String bloodtype;

    private User() {}

    public User(String name, int age, String bloodtype){
        this.name = name;
        this.age = age;
        this.bloodtype = bloodtype;
    }

    @Override
    public String toString(){
        return "User : { id: " + this.Id + ", name: " + name + ", age: " + age + ", bloodType: " + bloodtype;  
    }

}
