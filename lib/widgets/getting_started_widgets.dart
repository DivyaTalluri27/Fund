import 'package:flutter/material.dart';
import 'package:mutual_fund/helpers/constants.dart';
// import 'package:mutual_fund/helpers/constants.dart';

import '../palatte.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 70, top: 15),
      child: Text(
        'Customize For Your Own Investment',
        style: dheading,
      ),
    );
  }
}

class BuildInvest extends StatefulWidget {
  const BuildInvest({Key? key}) : super(key: key);

  @override
  State<BuildInvest> createState() => _BuildInvestState();
}

class _BuildInvestState extends State<BuildInvest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 50, top: 10),
          child: Text(
            'How many years planning to invest?',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  '1 Year',
                  style: fheading,
                )),
            TextButton(
                child: Text("3 Year"),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff0D4593)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ))),
                onPressed: () {
                  setState(() {});
                }),
            TextButton(
                onPressed: () {}, child: Text('5 Year', style: fheading)),
            TextButton(
                onPressed: () {}, child: Text('Above 5 Year', style: fheading)),
          ],
        )
      ],
    );
  }
}

class BuildTax extends StatelessWidget {
  const BuildTax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 165),
          child: Text(
            'TAX paying individual ?',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Yes',
                  style: fheading,
                )),
            TextButton(onPressed: () {}, child: Text('No', style: fheading)),
          ],
        )
      ],
    );
  }
}

class BuildRisk extends StatefulWidget {
  const BuildRisk({Key? key}) : super(key: key);

  @override
  _BuildRiskState createState() => _BuildRiskState();
}

class _BuildRiskState extends State<BuildRisk> {
  static List<String> monthlyList = UserConstantValues.monthly;
  String _dropdownMonthly = monthlyList[0];

  static List<String> riskList = UserConstantValues.risk;
  String _dropdownRisk = riskList[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 193),
          child: Text(
            'Monthly Investment',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButton<String>(
          value: _dropdownMonthly,
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              _dropdownMonthly = newValue!;
            });
          },
          items: List<DropdownMenuItem<String>>.generate(
            monthlyList.length,
            (int index) => new DropdownMenuItem<String>(
              value: monthlyList[index],
              child: new Text(
                monthlyList[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(right: 260),
          child: Text(
            'Risk Factor',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButton<String>(
          value: _dropdownRisk,
          isExpanded: true,
          onChanged: (String? newValue1) {
            setState(() {
              _dropdownRisk = newValue1!;
            });
          },
          items: List<DropdownMenuItem<String>>.generate(
            riskList.length,
            (int index) => new DropdownMenuItem<String>(
              value: riskList[index],
              child: new Text(
                riskList[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
