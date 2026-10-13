package com.example.libis1.model;

public class Signup {
    private int memberId;
    private String membername;
    private String memberLastName;
    private String email;
    private String password;

    public Signup(){
}
public Signup (int memberId,String membername, String memberLastName, String email, String password) {
    this.memberId = memberId;
    this.membername = membername;
    this.memberLastName = memberLastName;
    this.email = email;
    this.password = password;
}

public int getMemberId(){
    return memberId;
}

public void setMemberId (){
    }
}
