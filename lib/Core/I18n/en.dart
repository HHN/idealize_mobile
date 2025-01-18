import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/I18n/translations.dart';

class EnLanguageData extends LanguageDataKeys {
  EnLanguageData();

  @override
  Map<String, String> get keys => {
        AppStrings.addTag: "Add Tag",
        AppStrings.addTags: "Add Tags",
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
        AppStrings.delete: "Delete",
        AppStrings.deleteAccount: "Delete Account",
        AppStrings.deleteMaterial: "Delete Material",
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
        AppStrings.addNew: "Add new @name.",
        AppStrings.toAddNewTagOrCourse: "to add new tag or course.",
        AppStrings.toAddNew: "to add new @name.",
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
        AppStrings.emptyFavoriteProject: "You don't have any favorite projects yet.",
        AppStrings.emptyDraftProjectMessage: "You don't have any draft projects yet.",
        AppStrings.emptyDraftProject:
            "You don't have any draft projects yet. \n Start by creating a new project.",
        AppStrings.multiLineTextFieldHint: "Enter your text here",
        AppStrings.addLink: "Add Links:",
        AppStrings.addLinkTitle: "Link Name",
        AppStrings.addLinkUrl: "Add URL",
        AppStrings.courses: "Courses",
        AppStrings.addCourse: "Add Course",
        AppStrings.addCourses: "Add Courses",
        AppStrings.warningValidUrl: 'Please enter a valid URL',
        AppStrings.errorValidUrl: 'Please enter a valid URL',
        AppStrings.error: "Error",
        AppStrings.warning: "Warning",
        AppStrings.files: "Files:",
        AppStrings.uploadFile: "Upload File",
        AppStrings.uploadFiles: "Upload Files",
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
        AppStrings.tagNameValid: "Tag name must be valid!",
        AppStrings.editInformation: "Edit information?",
        AppStrings.tooManyRequests:
            "Too many requests exception, please try again later!",
        AppStrings.enterValidEmail: "Please enter a valid email",
        AppStrings.enterCodePassword: "Please enter code and password",
        AppStrings.passIsReset:
            "Your password has been reset, you will redirect to auth page in 3 seconds.",
        AppStrings.profileUpdated: "Profile updated successfully",
        AppStrings.profileUpdateFailed: "Failed to update profile",
        AppStrings.downloadError:
            "An error occurred during download. Please try again later.",
        AppStrings.downloadComplete: "File downloaded to:",
        AppStrings.requestSent:
            "Your request to join the project has been sent. Please wait for the project owner to respond.",
        AppStrings.ownerNotAvailable:
            "The project owner is not available. Please try again later.",
        AppStrings.projectReported: "The project has been reported.",
        AppStrings.fillRequiredFields:
            "Please fill all the required fields correctly",
        AppStrings.fileNotSupportedFormat:
            "The file @keyword1 is not a supported format",
        AppStrings.fileTooLarge: "The file @keyword2 is too large",
        AppStrings.noMediafileSelected: "No media file was selected",
        AppStrings.maximumFilesReached: "You have reached the maximum files!",
        AppStrings.fileTooLargeNotSupportedFormat:
            "The file @keyword3 is too large or not a supported format",
        AppStrings.noFileSelected: "No file was selected",
        AppStrings.maximumMedias: "You have reached the maximum medias!",
        AppStrings.fileAlreadyAdded: "The file @keyword4 is already added",
        AppStrings.writeAComment: "Write a comment",
        AppStrings.noUsersToShow: "There are no users to show.\nPlease check later.",
        AppStrings.emptyHere: "It is empty here!",
        AppStrings.fileUploadInfo: "File Upload Info",
        AppStrings.uploadInformation: "You can upload files up to 10 MB in size. Supported formats are PDF, DOC, PPT and PPTX .",
        AppStrings.fillAllFields: "Please fill all the fields",
        AppStrings.sureAboutDeletingMaterial: "Are you sure you want to delete the material from the project ? It will delete the material permanantly from the project!",
        AppStrings.passwordInstructions:
            "Password Requirements:\n- Minimum of 8 characters\n- At least one uppercase letter\n- At least one numeric digit\n- At least one special character",
        AppStrings.termsCondifitonCheckbox:
            "You have accepted the terms and conditions checkbox",
        AppStrings.tag: "Tag",
        AppStrings.course: "Course",
        AppStrings.studyProgram: "Study Program",
        AppStrings.skip: "Skip",
        AppStrings.photoAccessDenied:
            "Photo access denied, please allow access in settings",
        AppStrings.accessDenied: "Access Denied",
        AppStrings.okey: "Okey",
        AppStrings.skipReqDesc: "You have the option to skip this steps and add it later in your profile.",
      };
}
