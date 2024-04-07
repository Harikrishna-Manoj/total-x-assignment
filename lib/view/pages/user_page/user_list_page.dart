import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/controller/service/user_service/user_service.dart';
import 'package:total_x_assignment/controller/user_page_bloc/user_bloc.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/widgets/custom_floating_button.dart';
import 'package:total_x_assignment/view/widgets/custom_user_tile.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';
import 'package:total_x_assignment/view/widgets/search_field_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    context.read<UserBloc>().add(GetuserDataEvent());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange) {
      if (UserService.hasNext) {
        context.read<UserBloc>().add(GetuserDataEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(69.h),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              SizedBox(
                width: 3.w,
              ),
              const PageHeading(
                heading: "Nilambur",
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 297.w,
                    height: 44.h,
                    child: const SearchField(),
                  ),
                  const SortButton()
                ],
              ),
              height15,
              const PageHeading(heading: "Users List", textColor: Colors.black),
              height15,
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return state is UserLoadedState
                        ? state.userList.isNotEmpty
                            ? ListView.builder(
                                controller: scrollController,
                                itemCount: state.userList.length,
                                itemBuilder: (context, index) {
                                  return CustomUserTile(
                                    index: index,
                                    userList: state.userList,
                                  );
                                },
                              )
                            : const Center(
                                child: Text("No Data"),
                              )
                        : state is UserLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                ),
                              )
                            : const Center(
                                child: Text("No Data"),
                              );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
                height: 202.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 16.h,
                      ),
                      child: Text(
                        "Sort",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Radio(
                                activeColor: Colors.blue,
                                splashRadius: BorderSide.strokeAlignInside,
                                value: 2,
                                groupValue: 2,
                                onChanged: (value) {},
                              ),
                              Text(
                                sortingConditionList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ));
          },
        );
      },
      child: SizedBox(
        height: 32.h,
        width: 32.w,
        child: Image.asset("assets/image/icons/sort_icon.png"),
      ),
    );
  }
}
