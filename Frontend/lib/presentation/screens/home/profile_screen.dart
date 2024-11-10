import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/data/models/users/user_model.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-commerce"),
        actions: [
          Icon(
            Icons.shopping_cart,
            color: AppColors.text,
          ),
          const GapWidget()
        ],
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
          return userProfile(state.userModel);
        } else {
          return Center(
            child: Text("An error occurred"),
          );
        }
      }),
    );
  }

  Widget userProfile(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // "${userModel.fullName}",
                "Piyush Kumar",
                style: TextStyles.heading3,
              ),
              Text(
                "${userModel.email}",
                style: TextStyles.body2,
              ),
              LinkButton(
                text: "Edit Profile",
                color: AppColors.accent,
                onPressed: () {},
              )
            ],
          ),
          Divider(),
          ListTile(
            onTap: (){},
            title: Text("My Orders",style: TextStyles.body1,),
            leading: Icon(CupertinoIcons.cube_box_fill,),
          ),
          ListTile(
            onTap: (){
              BlocProvider.of<UserCubit>(context).signOut();
            },
            title: Text("Sign Out",style: TextStyles.body1.copyWith(color: Colors.red),),
            leading: Icon(Icons.exit_to_app,color: Colors.red,),
          )
        ],
      ),
    );
  }
}
