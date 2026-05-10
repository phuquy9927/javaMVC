package vn.qui.baloshop.service.validator;

import org.springframework.stereotype.Service;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.qui.baloshop.domain.dto.RegisterDTO;
import vn.qui.baloshop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {

    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (user.getPassword() != null
                && user.getConfirmPassword() != null
                && !user.getPassword().equals(user.getConfirmPassword())) {

            context.disableDefaultConstraintViolation();

            context.buildConstraintViolationWithTemplate("Password nhập không chính xác")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();

            valid = false;
        }

        // Additional validations can be added here
        // check email exist
        if (user.getEmail() != null
                && !user.getEmail().isBlank()
                && this.userService.checkEmailExist(user.getEmail())) {

            context.disableDefaultConstraintViolation();

            context.buildConstraintViolationWithTemplate("Email đã tồn tại")
                    .addPropertyNode("email")
                    .addConstraintViolation();

            valid = false;
        }

        return valid;
    }
}
