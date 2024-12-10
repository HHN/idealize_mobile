import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/I18n/translations.dart';

class EnLanguageData extends LanguageDataKeys {
  EnLanguageData();

  @override
  Map<String, String> get keys => {
        AppStrings.addTag: "Add Tag",
        AppStrings.searchNotFound: "Search not found",
        AppStrings.createNewProject: "Create New Project",
        AppStrings.editProject: "Edit Project",
        AppStrings.addProjekt: "Add Project",
        AppStrings.tags: "Tags:*",
        AppStrings.members: "Members",
        AppStrings.addMembers: "Add Members",
        AppStrings.next: "Next",
        AppStrings.edit: "Edit",
        AppStrings.close: "Close",
        AppStrings.done: "Done",
        AppStrings.required: "required",
        AppStrings.home: "Home",
        AppStrings.profile: "Profile",
        AppStrings.settings: "Settings",
        AppStrings.projectTitle: "Project Title:*",
        AppStrings.projectTitleHint: "Enter a title for your project",
        AppStrings.desciption: "Description:",
        AppStrings.descriptionHint: "Enter description here",
        AppStrings.saveAsDraft: "Save as draft",
        AppStrings.save: "Save",
        AppStrings.forgotPassword: "Forgot Password?",
        AppStrings.forgotPasswordHint:
            "Enter your email for verification. We will send a 4-digit code to your email",
        AppStrings.emailHint: "Enter your user email address",
        AppStrings.enterVerificationCode: "Enter 4-digit Code",
        AppStrings.enterVerificationCodeHint:
            "Enter the 4-digit code that you received via email.",
        AppStrings.didntReceiveCode: "Didn't receive code?",
        AppStrings.resendCode: "resend code",
        AppStrings.verificationCodeNotCorrect:
            "The code you entered is not correct",
        AppStrings.resetPassword: "Reset Password",
        AppStrings.resetPasswordHint: "Set the new password for your account.",
        AppStrings.newPassword: "New Password",
        AppStrings.newPasswordHint: "Enter new password",
        AppStrings.reEnterNewPassword: "Re-enter new password",
        AppStrings.reEnterPassword: "Re-enter password",
        AppStrings.resetSuccesful: "Reset Successful",
        AppStrings.findProjects: "Find Projects",
        AppStrings.projects: "Projects",
        AppStrings.trendingTab: "Trending",
        AppStrings.latestTab: "Latest",
        AppStrings.favoritesTab: "Favorites",
        AppStrings.openProject: "Open Project",
        AppStrings.backToTop: "Back to top",
        AppStrings.pullDownToRefresh: "Pull down to refresh",
        AppStrings.emptyList: "Your list is empty Refresh to load new projects",
        AppStrings.selectLanguage: "Select Language",
        AppStrings.english: "English",
        AppStrings.german: "German",
        AppStrings.signIn: "Sign In",
        AppStrings.userName: "User Name:",
        AppStrings.userNameHint: "Enter your user name",
        AppStrings.password: "Password",
        AppStrings.passwordHint: "Enter your password",
        AppStrings.clickHere: "click here",
        AppStrings.login: "Login",
        AppStrings.signUpHere: "sign up here",
        AppStrings.wrongCredentials: "password or user name incorrect!",
        AppStrings.myProjects: "My Projects",
        AppStrings.favorites: "Favorites",
        AppStrings.interests: "Interests:",
        AppStrings.addInterest: "Add Interests",
        AppStrings.classes: "Classes",
        AppStrings.addClasses: "Add Classes",
        AppStrings.firstName: "First Name",
        AppStrings.lastName: "Last Name",
        AppStrings.changePicture: "Change Picture",
        AppStrings.editProfile: "Edit Profile",
        AppStrings.cancel: "Cancel",
        AppStrings.projectSuccesfullyCreated: "Project was created!!!",
        AppStrings.goToProjectProfile: "Go to Project Profile",
        AppStrings.goToHomepage: "Go to Homepage",
        AppStrings.owner: "Owner",
        AppStrings.likes: "Likes",
        AppStrings.like: "Like",
        AppStrings.comments: "Comments",
        AppStrings.comment: "Comment",
        AppStrings.copy: "Copy",
        AppStrings.drafts: "Drafts",
        AppStrings.darkMode: "Dark Mode",
        AppStrings.lightMode: "Light Mode",
        AppStrings.textSize: "Text Size",
        AppStrings.language: "Language",
        AppStrings.privacy: "Privacy",
        AppStrings.security: "Security",
        AppStrings.deleteAccount: "Delete Account",
        AppStrings.logout: "Logout",
        AppStrings.splashScreenText:
            "Please log in or create an account to proceed",
        AppStrings.signUp: "Sign Up",
        AppStrings.addInterestHint: "Search interests",
        AppStrings.requestNewInterest:
            "Click here to send request for adding a new interest",
        AppStrings.email: "Email Address",
        AppStrings.exitsitingAccount: "Already have an account?",
        AppStrings.loginHere: "login here",
        AppStrings.passwordCriteriaFailed: "Must contain numbers and symbols",
        AppStrings.profilePicture: "Profile Picture:",
        AppStrings.finish: "Finish",
        AppStrings.textSizeSample: "Text sample to demonstrate the size",
        AppStrings.thisFieldAreRequired: "Fields marked with * are required",
        AppStrings.here: "here",
        AppStrings.alreadyHaveAnAccount: "Already have an account?",
        AppStrings.iAgree: "I agree with the ",
        AppStrings.termsAndConditions: "terms and conditions *.",
        AppStrings.isNotEmail: "Email is not valid",
        AppStrings.passIsNotStrong: "Password is not strong",
        AppStrings.passIsNotMatch: "Passwords do not match",
        AppStrings.couldNotBeEmpty: "Field cannot be empty",
        AppStrings.pleaseLoginOrSignUp:
            "Please login or create an account to proceed",
        AppStrings.resetIt: "Reset it ",
        AppStrings.dontHaveAnAccount: "Don't have an account?",
        AppStrings.addProgram: "Add Program",
        AppStrings.isEmpty: "Field cannot be empty",
        AppStrings.search: "Search",
        AppStrings.click: "Click",
        AppStrings.studyPrograms: "Study Programs:",
        AppStrings.addNewTagOrCourse: "Add new tag or course.",
        AppStrings.confirmationRequired: "Confirmation Required",
        AppStrings.skipRegistrationStepsMsg:
            "You have the option to skip the registration steps and complete them later in your profile settings.",
        AppStrings.okay: "Okay",
        AppStrings.gallery: "Gallery",
        AppStrings.camera: "Camera",
        AppStrings.registartionSuccessMsg:
            "Registration Completed Successfully 🎉",
        AppStrings.startUsingIdealize: "Start using Idealize",
        AppStrings.newHome: "New",
        AppStrings.forYou: "For You",
        AppStrings.weeklyTrend: "Weekly Trend",
        AppStrings.addNewProject: "Add New Project",
        AppStrings.or: "Or",
        AppStrings.workOnAProjectFromDraft: "Work on a project from draft:",
        AppStrings.emptyDraftProject:
            "You don't have any draft projects yet. \n Start by creating a new project.",
        AppStrings.multiLineTextFieldHint: "Enter your text here",
        AppStrings.addLink: "Add Links:",
        AppStrings.addLinkTitle: "Link Name",
        AppStrings.addLinkUrl: "Add URL",
        AppStrings.courses: "Courses",
        AppStrings.addCourse: "Add Course",
        AppStrings.warningValidUrl: 'Please enter a valid URL',
        AppStrings.errorValidUrl: 'Please enter a valid URL',
        AppStrings.error: "Error",
        AppStrings.warning: "Warning",
        AppStrings.files: "Files:",
        AppStrings.uploadFile: "Upload File",
        AppStrings.media: "Media:",
        AppStrings.uploadMedia: "Upload Media",
        AppStrings.thumbnail: "Thumbnail:",
        AppStrings.uploadThumbnail: "Upload Thumbnail",
        AppStrings.publish: "Publish",
        AppStrings.emptyNotification: "No notifications yet.",
        AppStrings.notification: "Notifications",
        AppStrings.clearAll: "Clear all",
        AppStrings.responseSent: "Response sent",
        AppStrings.responseSentMsg: "Response sent successfully",
        AppStrings.firstNameHint: "Your first name",
        AppStrings.lastNameHint: "Your last name",
        AppStrings.backToHome: "Back to Home",
        AppStrings.newProject: "New Project",
        AppStrings.addStudyPrograms: "Add Study Programs",
        AppStrings.projectDetails: "Project Details",
        AppStrings.aboutProject: "About Project",
        AppStrings.projectMaterials: "Project Materials",
        AppStrings.noComments:
            "No Comments Available!\nBe the first to comment!",
        AppStrings.noContributors: "No Contributors",
        AppStrings.joinProject: "Join Project",
        AppStrings.report: "Report",
      };
}
