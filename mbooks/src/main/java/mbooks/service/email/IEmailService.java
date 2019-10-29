package mbooks.service.email;




import mbooks.model.Email;
import mbooks.technical.email.EmailWrapper;

import java.util.List;

public interface IEmailService {
    List<Email> findAll();
    void save(Email email);
    void sendRevival(List<EmailWrapper> emailList);


}
