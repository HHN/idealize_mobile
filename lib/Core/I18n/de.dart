import 'package:idealize_new_version/Core/I18n/messages.dart';
import 'package:idealize_new_version/Core/I18n/translations.dart';

class DeLanguageData extends LanguageDataKeys {
  DeLanguageData();

  @override
  Map<String, String> get keys => {
        AppStrings.addTag: "Schlagwort hinzufügen",
        AppStrings.searchNotFound: "keine Suchergebnisse",
        AppStrings.createNewProject: "Neues Projekt erstellen",
        AppStrings.editProject: "Projekt bearbeiten",
        AppStrings.addProjekt: "Projeckt hinzufügen",
        AppStrings.tags: "Schlagworte:*",
        AppStrings.members: "Team",
        AppStrings.addMembers: "Zum Team hinzufügen",
        AppStrings.next: "Weiter",
        AppStrings.edit: "Bearbeiten",
        AppStrings.close: "Schließen",
        AppStrings.done: "Fertig",
        AppStrings.required: "erforderlich",
        AppStrings.home: "Home",
        AppStrings.profile: "Profil",
        AppStrings.settings: "Einstellungen",
        AppStrings.projectTitle: "Projekttitel:*",
        AppStrings.projectTitleHint: "Gib deinem Projekt einen Titel",
        AppStrings.desciption: "Beschreibung:",
        AppStrings.descriptionHint: "Gib eine Beschreibung ein",
        AppStrings.saveAsDraft: "Als Entwurf speichern",
        AppStrings.save: "Speichern",
        AppStrings.forgotPassword: "Passwort vergessen?",
        AppStrings.forgotPasswordHint:
            "Gib deine E-Mailadresse ein. Wir senden dir einen 4 stelligen Bestätigungscode.",
        AppStrings.emailHint: "Gib deine E-Mailadresse ein",
        AppStrings.enterVerificationCode: "Bestätigungscode eingeben",
        AppStrings.enterVerificationCodeHint:
            "Gib den 4 stelligen Code ein, den du per Mail bekommen hast.",
        AppStrings.didntReceiveCode: "Code nicht erhalten?",
        AppStrings.resendCode: "Erneut senden",
        AppStrings.verificationCodeNotCorrect:
            "Der eingegebene Code ist falsch",
        AppStrings.resetPassword: "Neues Passwort vergeben",
        AppStrings.resetPasswordHint:
            "Gib ein neues Passwort für deinen Account ein.",
        AppStrings.newPassword: "Neues Passwort",
        AppStrings.newPasswordHint: "Neues Passwort eingeben",
        AppStrings.reEnterNewPassword: "Neues Passwort erneut eingeben",
        AppStrings.reEnterPassword: "Passwort erneut eingeben",
        AppStrings.resetSuccesful: "Passwort erfolgreich geändert",
        AppStrings.findProjects: "Projekte suchen",
        AppStrings.projects: "Projekte",
        AppStrings.trendingTab: "Trends",
        AppStrings.latestTab: "Neu",
        AppStrings.favoritesTab: "Favoriten",
        AppStrings.openProject: "Projekt anzeigen",
        AppStrings.backToTop: "zurück nach oben",
        AppStrings.pullDownToRefresh: "zum Aktualisiren nach unten ziehen",
        AppStrings.emptyList:
            "Keine Ergebnisse Aktualisieren für neue Projekte",
        AppStrings.selectLanguage: "Sprache wählen",
        AppStrings.english: "Englisch",
        AppStrings.german: "Deutsch",
        AppStrings.signIn: "Anmelden",
        AppStrings.userName: "Benutzername:",
        AppStrings.userNameHint: "Gib deinen Benutzernamen ein",
        AppStrings.password: "Passwort",
        AppStrings.passwordHint: "Gib dein Passwort ein",
        AppStrings.clickHere: "Hier klicken",
        AppStrings.login: "Anmelden",
        AppStrings.signUpHere: "Hier registrieren!",
        AppStrings.wrongCredentials:
            "Dein Passwort oder der Nutzername ist falsch.",
        AppStrings.myProjects: "Meine Projekte",
        AppStrings.favorites: "Favoriten",
        AppStrings.interests: "Interessen:",
        AppStrings.addInterest: "Interesse hinzufügen",
        AppStrings.classes: "Kurse",
        AppStrings.addClasses: "Kurs hinzufügen",
        AppStrings.firstName: "Vorname",
        AppStrings.lastName: "Nachname",
        AppStrings.changePicture: "Bild bearbeiten",
        AppStrings.editProfile: "Profil bearbeiten",
        AppStrings.cancel: "Abbrechen",
        AppStrings.projectSuccesfullyCreated: "Projekt erfolgreich erstellt!",
        AppStrings.goToProjectProfile: "Projekt anzeigen",
        AppStrings.goToHomepage: "zur Startseite",
        AppStrings.owner: "Besitzer",
        AppStrings.likes: "Likes",
        AppStrings.like: "Like",
        AppStrings.comments: "Komentare",
        AppStrings.comment: "Komentar",
        AppStrings.copy: "kopieren",
        AppStrings.drafts: "Entwürfe",
        AppStrings.darkMode: "dunkler Modus",
        AppStrings.lightMode: "heller Modus",
        AppStrings.textSize: "Schriftgröße",
        AppStrings.language: "Sprache",
        AppStrings.privacy: "Privatsphäre",
        AppStrings.security: "Sicherheit",
        AppStrings.deleteAccount: "Account löschen",
        AppStrings.logout: "Abmelden",
        AppStrings.splashScreenText:
            "Bitte anmelden oder registrieren um fortzufahren",
        AppStrings.signUp: "Registrieren",
        AppStrings.addInterestHint: "Interessen finden",
        AppStrings.requestNewInterest:
            "Hier klicken um ein neues Interesse anzufragen",
        AppStrings.email: "E-Mailadresse",
        AppStrings.exitsitingAccount: "Schon registriert?",
        AppStrings.loginHere: "Hier anmelden",
        AppStrings.passwordCriteriaFailed:
            "Muss Zahlen und Sonderzeichen enthalten",
        AppStrings.profilePicture: "Profilbild:",
        AppStrings.finish: "Abschließen",
        AppStrings.textSizeSample: "Beispieltext zur Anzeige der Schriftgröße",
        AppStrings.thisFieldAreRequired: "Felder mit * sind erforderlich",
        AppStrings.here: "hier",
        AppStrings.alreadyHaveAnAccount: "Schon registriert?",
        AppStrings.iAgree: "Ich stimme zu mit den ",
        AppStrings.termsAndConditions: "Nutzungsbedingungen *.",
        AppStrings.isNotEmail: "E-Mail ist nicht gültig",
        AppStrings.passIsNotStrong: "Passwort ist nicht sicher",
        AppStrings.passIsNotMatch: "Passwörter stimmen nicht überein",
        AppStrings.couldNotBeEmpty: "Feld darf nicht leer sein",
        AppStrings.pleaseLoginOrSignUp:
            "Bitte melde dich an oder registriere dich um fortzufahren",
        AppStrings.resetIt: "Zurücksetzen ",
        AppStrings.dontHaveAnAccount: "Noch keinen Account?",
        AppStrings.isEmpty: "Feld darf nicht leer sein",
        AppStrings.studyPrograms: "Studiengänge:",
        AppStrings.addProgram: "Studiengang hinzufügen",
        AppStrings.search: "Suche",
        AppStrings.click: "Klick",
        AppStrings.addNewTagOrCourse: "Neues Schlagwort oder Kurs hinzufügen.",
        AppStrings.confirmationRequired: "Bestätigung erforderlich",
        AppStrings.skipRegistrationStepsMsg:
            "Sie haben die Möglichkeit, die Registrierungsschritte zu überspringen und sie später in Ihren Profileinstellungen zu vervollständigen.",
        AppStrings.okay: "Okay",
        AppStrings.gallery: "Galerie",
        AppStrings.camera: "Kamera",
        AppStrings.registartionSuccessMsg:
            "Registrierung erfolgreich abgeschlossen 🎉",
        AppStrings.startUsingIdealize: "Idealize starten",
        AppStrings.newHome: "Neu",
        AppStrings.forYou: "Für dich",
        AppStrings.weeklyTrend: "Wöchentliche Trends",
        AppStrings.addNewProject: "Neues Projekt hinzufügen",
        AppStrings.or: "Oder",
        AppStrings.workOnAProjectFromDraft: "Arbeite an einem Entwurf:",
        AppStrings.emptyDraftProject:
            "Sie haben noch keine Entwurfsprojekte. \n Beginnen Sie mit der Erstellung eines neuen Projekts.",
        AppStrings.multiLineTextFieldHint: "Geben Sie Ihren Text hier ein",
        AppStrings.addLink: "Link hinzufügen",
        AppStrings.addLinkTitle: "Link Name",
        AppStrings.addLinkUrl: "URL hinzufügen",
        AppStrings.courses: "Kurse",
        AppStrings.addCourse: "Kurs hinzufügen",
        AppStrings.files: "Dateien:",
        AppStrings.uploadFile: "Datei hochladen",
        AppStrings.media: "Medien:",
        AppStrings.uploadMedia: "Medien hochladen",
        AppStrings.thumbnail: "Thumbnail:",
        AppStrings.uploadThumbnail: "Thumbnail hochladen",
        AppStrings.publish: "Veröffentlichen",
        AppStrings.emptyNotification: "Keine Benachrichtigungen.",
        AppStrings.notification: "Benachrichtigungen",
        AppStrings.clearAll: "Alle löschen",
        AppStrings.responseSent: "Antwort gesendet",
        AppStrings.responseSentMsg: "Antwort gesendet",
        AppStrings.firstNameHint: "Dein Vorname",
        AppStrings.lastNameHint: "Dein Nachname",
        AppStrings.backToHome: "Zurück zur Startseite",
        AppStrings.newProject: "Neues Projekt",
        AppStrings.addStudyPrograms: "Studiengänge hinz",
        AppStrings.projectDetails: "Projektdetails",
        AppStrings.aboutProject: "Über das Projekt",
        AppStrings.projectMaterials: "Projektmaterialien",
        AppStrings.noComments: "Keine Kommentare",
        AppStrings.noContributors: "Keine Mitwirkenden",
        AppStrings.joinProject: "Projekt beitreten",
        AppStrings.report: "Melden",
      };
}
