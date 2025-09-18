import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';

const activeColor = Color(0xFF3FB8BF);
const inactiveColor = Color(0xFFFFFFFF);
const genderIconColor = Color(0xFF3FB8BF);
const styleLabel = TextStyle(
  fontSize: 20,
  letterSpacing: 3,
  wordSpacing: 3,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedGender; // 0 for male, 1 for female, null for no selection
  int height = 180;
  int weight = 70;
  int age = 20;
  int bmi = 0;

  double calculateBMI() {
    double bmiValue = (weight / (height * height / 10000));
    return bmiValue;
  }

  void updateGender(int genderNo) {
    setState(() {
      selectedGender = genderNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2.5,
                      wordSpacing: 2.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: Image(
                      image: AssetImage('images/images1.png'),
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Enter your height and weight\n    using metric measures',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2.5,
                        wordSpacing: 2.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 6,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: double.infinity,
            height: 500,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GenderButton(
                      icon: FontAwesomeIcons.mars,
                      genderNo: 0,
                      isSelected: selectedGender == 0,
                      onTap: updateGender,
                    ),
                    GenderButton(
                      icon: FontAwesomeIcons.venus,
                      genderNo: 1,
                      isSelected: selectedGender == 1,
                      onTap: updateGender,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'HEIGHT',
                  style: styleLabel,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 158),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(fontSize: 35),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 20),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: activeColor,
                      thumbColor: activeColor,
                      overlayColor: const Color(0x293FB8BF)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 210,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: styleLabel,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: activeColor,
                                size: 20,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: const TextStyle(fontSize: 35),
                                ),
                                const Text(
                                  'KGs',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: activeColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'AGE',
                          style: styleLabel,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: activeColor,
                                size: 20,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: const TextStyle(fontSize: 35),
                                ),
                                const Text(
                                  'YRs',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: activeColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                        elevation: 5,
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            bMI: calculateBMI(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 3,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bMI});

  final double bMI;

  Widget printImage() {
    if (bMI < 18.4) {
      return const Image(
        image: AssetImage('images/under.jpg'),
        width: 130,
      );
    }
    if (bMI >= 18.5 && bMI < 24.9) {
      return const Image(
        image: AssetImage('images/normal.jpg'),
        width: 130,
      );
    }
    if (bMI >= 25 && bMI < 29.9) {
      return const Image(
        image: AssetImage('images/over.jpg'),
        width: 130,
      );
    }
    if (bMI >= 30 && bMI < 34.9) {
      return const Image(
        image: AssetImage('images/obese.jpg'),
        width: 130,
      );
    } else {
      return const Image(
        image: AssetImage('images/extreme.jpg'),
        width: 130,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: activeColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 290.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[900],
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              height: 350,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your BM is',
                    style: styleLabel,
                  ),
                  Text(
                    bMI.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: activeColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  printImage(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  '            BMI Categories:\n       Underweight = ‹18.5\n   Normal weight = 18.5-24.9\n      Overweight = 25-29.9\nObesity = BMI of 30 or greater',
                  style: TextStyle(
                    fontSize: 18,
                    color: inactiveColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.refresh_outlined,
                  size: 30,
                  color: activeColor,
                ))
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.icon,
    required this.genderNo,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final int genderNo;
  final bool isSelected;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(genderNo),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: isSelected
            ? activeColor.withOpacity(1)
            : Colors.grey.withOpacity(1),
        backgroundColor: isSelected ? activeColor : inactiveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : genderIconColor,
        size: 30,
      ),
    );
  }
}
