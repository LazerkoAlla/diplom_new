package by.iba.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String login;
    private String password;
    private int role;
    private boolean isBlocked;
    private String firstName;
    private String lastName;
    private String street;
    private String city;
    private String country;
}