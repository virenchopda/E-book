import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": enUS,
        //  "bn": inHI,
      };

  final Map<String, String> enUS = {
    /// ONBOARDING
    'welcomeToEbook': 'Welcome to E-book',
    'onboardingMessage':
        'The number of one best Ebook Store & Reader application in this century',
    'createAnAccount': 'Create an account',
    'enterYourName':
        'Enter your username, email & password. if you forget it. then you have to do forgot password.',
    'getStarted': 'Get Started',
    'alreadyHaveAnAccount': 'Already Have An Account',
    'email': 'Email',
    'username': 'Username',
    'password': 'Password',
    'confirmPassword': 'Confirm password',
    'rememberMe': 'Remember me',
    'signUp': 'Sign Up',

    /// complete profile components
    'completeYourProfile': 'Complete your profile',
    'profileDescription':
        'Don\'t worry, only you can see your personal data. No one else will be able to see it.',
    'fullName': 'Full name',
    'phoneNumber': 'Phone number',
    'dateOfBirth': 'Date of birth',
    'country': 'Country', 'continue': 'Continue',

    /// APIn MESSAGES
    'serverError': 'Server error',
    'noDataFound': "No data found",

    /// TEXT FIELD
    'fieldIsRequired': 'Field is required',
    'enterValidName': 'Enter valid name',
    'mobileNumberMoreThen': 'Mobile number must be 10 char',
    'passwordMoreThen': 'password must be more then 6 char',
    'enterValidCity': 'Enter valid city',
    'enterValidState': 'Enter valid state',
    'enterValidPincode': 'Enter valid pincode',
    'enterValidAddress': 'Enter valid address',
    'enterValidEmail': 'Enter valid email',
  };

//final Map<String, String> inHI = {
// };
}
