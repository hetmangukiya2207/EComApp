import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/ColorUtils.dart';
import '../../../Utils/ImageUtils.dart';
import '../Utils/ButtonOrText.dart';
import '../Utils/PasswordTextField.dart';
import '../Utils/TextFormField.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: 327,
            child: Column(
              children: [
                Text(
                  'Hi, Welcome Back! 👋',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ).copyWith(color: AppColor.kGrayscaleDark100, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'We happy to see you. Sign In to your account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.kWhite)
                      .copyWith(color: AppColor.kGrayscale40, fontSize: 14),
                ),
                const SizedBox(height: 36),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.kWhite)
                          .copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PrimaryTextFormField(
                        borderRadius: BorderRadius.circular(24),
                        hintText: 'Enter Your Gmail',
                        controller: emailC,
                        width: 327,
                        height: 52)
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.kWhite)
                          .copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    PasswordTextField(
                        borderRadius: BorderRadius.circular(24),
                        hintText: 'Password',
                        controller: passwordC,
                        width: 327,
                        height: 52)
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryTextButton(
                      onPressed: () {},
                      title: 'Forgot Password?',
                      textStyle: const TextStyle(),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Column(
                  children: [
                    PrimaryButton(
                      elevation: 0,
                      onTap: () {},
                      text: 'LogIn',
                      bgColor: AppColor.kPrimary,
                      borderRadius: 20,
                      height: 46,
                      width: 327,
                      textColor: AppColor.kWhite,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: CustomRichText(
                        title: 'Don’t have an account?',
                        subtitle: ' Create here',
                        onTab: () {
                          Navigator.of(context).pushNamed('SignupPage');
                        },
                        subtitleTextStyle: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kWhite)
                            .copyWith(
                                color: AppColor.kPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    children: [
                      const DividerRow(title: 'Or Sign In with'),
                      const SizedBox(height: 24),
                      SecondaryButton(
                          height: 56,
                          textColor: AppColor.kGrayscaleDark100,
                          width: 280,
                          onTap: () {},
                          borderRadius: 24,
                          bgColor: AppColor.kBackground.withOpacity(0.3),
                          text: 'Continue with Google',
                          icons: ImagesPath.kGoogleIcon),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TermsAndPrivacyText(
                    title1: '  By signing up you agree to our',
                    title2: ' Terms ',
                    title3: '  and',
                    title4: ' Conditions of Use',
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
