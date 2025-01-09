import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(!Responsive.isDesktop(context)) IconButton(onPressed: () {},
        icon: Icon(Icons.menu)),
        if(!Responsive.isMobile(context))
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white, //**Add copywith to add color */
              ),
        ),
        if(!Responsive.isMobile(context))
        Spacer(flex: Responsive.isDesktop(context) ? 2:1,),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      margin: EdgeInsets.only(left: defaultPadding),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2),
            child: Text("Angelina Joli"),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(color: primaryColor),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
          )),
    );
  }
}
