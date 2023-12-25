import 'package:calendar_app/constants/customColor.dart';
import 'package:calendar_app/utils/toastMessage.dart';
import 'package:calendar_app/widgets/register/company.dart';
import 'package:calendar_app/widgets/register/phone.dart';
import 'package:calendar_app/widgets/register/position.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController companyNameController;
  late final TextEditingController phoneController;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String position = '직원';
  int _currentStep = 0;
  bool isCompanyExist = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: CustomColor.skyBlue),
        title: const Text(
          'Register',
          style: TextStyle(
            color: CustomColor.skyBlue,
          ),
        ),
      ),
      body: Theme(
        data: ThemeData(
          // primaryColor: CustomColor.skyBlue,
          colorScheme: const ColorScheme.light(primary: CustomColor.skyBlue),
        ),
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
          controlsBuilder: _controlsBuilder,
          type: StepperType.horizontal,
          steps: _buildSteps(),
        ),
      ),
    );
  }

  void changePosition(String newPosition) {
    setState(() {
      position = newPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController();
    phoneController = TextEditingController();
  }

  void onChangeCompanyExisted() {
    setState(() {
      isCompanyExist = !isCompanyExist;
      position = '관리자';
    });
  }

  Step _buildStep({
    required String title,
    required Widget content,
    required bool isActive,
    required bool isEditing,
  }) {
    return Step(
      title: Text(title),
      content: SizedBox(
        height: MediaQuery.of(context).size.height - 350,
        child: content,
      ),
      isActive: isActive,
      state: isEditing
          ? StepState.editing
          : isActive
              ? StepState.complete
              : StepState.disabled,
    );
  }

  List<Step> _buildSteps() {
    return [
      _buildStep(
        title: 'Step 1',
        content: Form(
          key: _formKey1,
          child: ChooseCompany(
            companyNameController: companyNameController,
            isCompanyExist: isCompanyExist,
            onCompanyNameChanged: onChangeCompanyExisted,
          ),
        ),
        isActive: _currentStep >= 0,
        isEditing: _currentStep == 0,
      ),
      _buildStep(
        title: 'Step 2',
        content: Form(
          key: _formKey2,
          child: Position(
            position: position,
            onPositionChanged: changePosition,
          ),
        ),
        isActive: _currentStep >= 1,
        isEditing: _currentStep == 1,
      ),
      _buildStep(
        title: 'Step 3',
        content:
            Form(key: _formKey3, child: Phone(controller: phoneController)),
        isActive: _currentStep >= 2,
        isEditing: _currentStep == 2,
      ),
    ];
  }

  Widget _controlsBuilder(BuildContext context, _) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _currentStep != 0
              ? OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: CustomColor.skyBlue, width: 1)),
                  ),
                  onPressed: _.onStepCancel,
                  child: const Text('PREV'),
                )
              : Container(),
          _currentStep != 2
              ? ElevatedButton(
                  onPressed: () {
                    if (_currentStep == 0 &&
                        _formKey1.currentState!.validate()) {
                      _formKey1.currentState!.save();
                      _.onStepContinue();
                    } else if (_currentStep == 1 &&
                        _formKey2.currentState!.validate()) {
                      _formKey2.currentState!.save();
                      _.onStepContinue();
                    }
                  },
                  child: const Text('NEXT'),
                )
              : ElevatedButton(
                  onPressed: () {
                    if (_formKey3.currentState!.validate()) {
                      _formKey3.currentState!.save();
                      print('회사명: ${companyNameController.text}');
                      print('직책: $position');
                      print('전화번호: ${phoneController.text}');
                      context.replace('/');
                    }
                  },
                  child: const Text('FINISH'),
                ),
        ],
      ),
    );
  }

  void _onStepCancel() {
    if (_currentStep <= 0) return;
    setState(() {
      _currentStep -= 1;
    });
  }

  void _onStepContinue() {
    // if (companyNameController.text.isEmpty) {
    //   showErrorMessage('회사명을 입력해주세요.');
    //   return;
    // }
    if (_currentStep >= 2) return;
    setState(() {
      _currentStep += 1;
    });
  }
}
