import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/data/models/users/user_model.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "editProfileScreen";

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          centerTitle: true,
        ),
        body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return Center(
                child: Text(
              state.errorMessage,
            ));
          }
          if (state is UserLoggedInState) {
            return editProfile(state.userModel);
          }
          return Center(child: Text("An error occurred"));
        }));
  }

  Widget editProfile(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          Text(
            "Personal details",
            style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
          ),
          GapWidget(
            size: -5,
          ),
          PrimaryTextField(
            labelText: "Full Name",
            initialValue: userModel.fullName,
            onChanged: (value) {
              userModel.fullName = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your full name";
              }
              // Regular expression to allow only letters and spaces
              final nameRegExp = RegExp(r'^[A-Za-z\s]+$');
              if (!nameRegExp.hasMatch(value)) {
                return "Full name should only contain letters and spaces";
              }
              return null; // Name is valid
            },
          ),
          GapWidget(),
          PrimaryTextField(
              labelText: "Phone number",
              initialValue: userModel.phoneNumber,
              onChanged: (value) {
                userModel.phoneNumber = value;
              },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your phone number";
              }
              // Check if the input contains only digits
              final phoneRegExp = RegExp(r'^[0-9]+$');
              if (!phoneRegExp.hasMatch(value)) {
                return "Phone number should contain only numbers";
              }
              // Check if the phone number has the right length (e.g., 10 digits)
              if (value.length != 10) {
                return "Phone number should be exactly 10 digits";
              }
              return null; // Phone number is valid
            },
          ),
          GapWidget(),
          Text(
            "Address",
            style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
          ),
          GapWidget(
            size: -5,
          ),
          PrimaryTextField(
            labelText: "Address",
            initialValue: userModel.address,
            onChanged: (value) {
              userModel.address = value;
            },
          ),
          GapWidget(),
          PrimaryTextField(
            labelText: "City",
            initialValue: userModel.city,
            onChanged: (value) {
              userModel.city = value;
            },
          ),
          GapWidget(),
          PrimaryTextField(
              labelText: "State",
              initialValue: userModel.state,
              onChanged: (value) {
                userModel.state = value;
              }),
          GapWidget(),
          PrimaryButton(
            text: "Save",
            color: AppColors.accent,
            textColor: AppColors.white,
            onPressed: () async {
              bool success = await BlocProvider.of<UserCubit>(context)
                  .updateUser(userModel);
              if (success) {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
