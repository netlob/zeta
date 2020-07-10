import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zeta/locator.dart';
import 'package:zeta/routes.dart';
import 'package:zeta/services/zermelo_service.dart';
import 'package:zeta/utils/device/device_utils.dart';
import 'package:zeta/widgets/progress_indicator_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _schoolController =
      TextEditingController(text: "stijnvanderkolk");
  TextEditingController _codeController = TextEditingController();

  final ZermeloService _zermeloService = locator<ZermeloService>();

  String school = "";
  String code = "";
  String error = "";

  //form key:-------------------------------------------------------------------
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      // appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
        child: Stack(
      children: [
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Stack(
              children: <Widget>[
                Text(
                  "ZETA",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                // MediaQuery.of(context).orientation == Orientation.landscape
                //     ? Row(
                //         children: <Widget>[
                //           Expanded(
                //             flex: 1,
                //             child: _buildLeftSide(),
                //           ),
                //           Expanded(
                //             flex: 1,
                //             child: _buildRightSide(),
                //           ),
                //         ],
                //       )
                //     :
                Center(child: _buildRightSide()),
                _buildSignInButton(),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  // Widget _buildLeftSide() {
  //   return SizedBox.expand(
  //     child: Image.asset(
  //       'assets/images/login_bg.jpg',
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  Widget _buildRightSide() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
              Center(
                child: Text(
                  "Welkom\nterug!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
              ),
              // SizedBox(height: 24.0),
              _buildSchoolField(),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  _buildCodeField(),
                  _buildScanQrButton(),
                ],
              ),
              // _buildUserIdField(),
              // _buildPasswordField(),
              // _buildForgotPasswordButton(),
              // _buildSignInButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchoolField() {
    return Observer(
      builder: (context) {
        return Container(
          height: 100,
          child: Row(
            children: <Widget>[
              // Text("https://",
              //     style: TextStyle(
              //         color: Colors.white,
              //         decorationColor: Colors.white,
              //         backgroundColor: Colors.transparent,
              //         fontSize: 20)),
              // SizedBox(width: 10),
              Flexible(
                  child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontSize: 20),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    labelText: 'School',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                validator: (val) => val.isEmpty || val.indexOf(".") > 1
                    ? "Vul een school in (zonder .zportal.nl)"
                    : null,
                onChanged: (val) => setState(() => school = val),
              )),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  ".zportal.nl",
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCodeField() {
    return Observer(
      builder: (context) {
        return Container(
          height: 100,
          child: TextFormField(
            obscureText: false,
            validator: (val) => val.length != 12 && val.length != 15
                ? 'Vul een koppelcode in'
                : null,
            onChanged: (val) {
              setState(() => code = val);
            },
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              decorationColor: Colors.white,
              backgroundColor: Colors.transparent,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
              fillColor: Colors.white,
              focusColor: Colors.white,
              labelText: 'Koppel code',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScanQrButton() {
    return Positioned(
      top: 70,
      right: -15,
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () {
            print("predssed");
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textColor: Colors.black,
          child: Text(
            "QR code scannen?",
            style: TextStyle(
                color: Colors.white54,
                fontSize: 18,
                fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color.fromRGBO(227, 97, 145, 1),
          padding: EdgeInsets.symmetric(vertical: 15),
          onPressed: () async {
            DeviceUtils.hideKeyboard(context);
            dynamic result = _zermeloService.login(
              school: school,
              code: code,
            );
            if (result is String) {
              setState(() {
                print(result);
                error = result;
              });
            } else if (result is bool && result == true) {
              print("result is bool && result == true");
              // Navigator.of(context).pushReplacementNamed(Routes.home);
              navigate(context);
            }
          },
          child: Text(
            'Inloggen',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _schoolController.dispose();
    _codeController.dispose();
    super.dispose();
  }
}
