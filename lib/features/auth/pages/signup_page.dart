import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/dimensions.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/utils/validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    // Set system UI overlay style for mobile
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    if (_formKey.currentState!.validate()) {
      // Implement signup logic
      context.go('/dashboard');
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              left: AppDimensions.lg,
              right: AppDimensions.lg,
              top: AppDimensions.lg,
              bottom: AppDimensions.lg + MediaQuery.of(context).padding.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    (AppDimensions.lg * 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Add more top spacing
                  const SizedBox(height: AppDimensions.xl),

                  // App Logo and Title
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          LucideIcons.heart,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.lg),
                      Text(
                        'Get Started!',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.sm),
                      Text(
                        'Create your account to start fundraising',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(height: AppDimensions.xl),

                  // Signup Form
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.lg),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.onSurface.withValues(alpha: 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Full Name',
                            hint: 'Enter your full name',
                            controller: _nameController,
                            validator: Validators.validateName,
                            prefixIcon: LucideIcons.user,
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.lg),
                          CustomTextField(
                            label: 'Email',
                            hint: 'Enter your email',
                            controller: _emailController,
                            validator: Validators.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: LucideIcons.mail,
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.lg),
                          CustomTextField(
                            label: 'Password',
                            hint: 'Enter your password',
                            controller: _passwordController,
                            validator: Validators.validatePassword,
                            obscureText: _obscurePassword,
                            prefixIcon: LucideIcons.lock,
                            suffixIcon: _obscurePassword
                                ? LucideIcons.eye
                                : LucideIcons.eyeOff,
                            onSuffixIconPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.lg),
                          CustomTextField(
                            label: 'Confirm Password',
                            hint: 'Confirm your password',
                            controller: _confirmPasswordController,
                            validator: _validateConfirmPassword,
                            obscureText: _obscureConfirmPassword,
                            prefixIcon: LucideIcons.lock,
                            suffixIcon: _obscureConfirmPassword
                                ? LucideIcons.eye
                                : LucideIcons.eyeOff,
                            onSuffixIconPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.xl),
                          CustomButton(
                            text: 'Create Account',
                            onPressed: _onSignup,
                            icon: LucideIcons.userPlus,
                          ),
                          const SizedBox(height: AppDimensions.lg),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                      color: AppColors.onSurface.withValues(alpha: 0.2))),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimensions.sm),
                                child: Text(
                                  'OR',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.onSurface.withValues(alpha: 0.5),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                      color: AppColors.onSurface.withValues(alpha: 0.2))),
                            ],
                          ),
                          const SizedBox(height: AppDimensions.lg),
                          CustomButton(
                            text: 'Continue with Google',
                            onPressed: () {
                              // Implement Google sign in
                            },
                            isOutlined: true,
                            icon: LucideIcons.mail,
                          ),
                          const SizedBox(height: AppDimensions.xl),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.onSurface.withValues(alpha: 0.7),
                                      fontSize: 14,
                                    ),
                              ),
                              TextButton(
                                onPressed: () => context.go('/login'),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Add bottom spacing for better mobile experience
                  SizedBox(
                      height: isKeyboardVisible
                          ? AppDimensions.lg
                          : AppDimensions.xl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
