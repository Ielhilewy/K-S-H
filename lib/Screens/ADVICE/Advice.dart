import 'dart:ui';

import 'package:flutter/material.dart';

class advice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
              child: Image.asset(
                'assets/images/gfr.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Color(0xff205072),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 2500,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/images/Icons.png',
                                width: 140,
                                height: 100,
                              ),
                            ),
                            Text(
                              'Kidney Health:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Part One: Improving Your Diet',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Most common causes of kidney disease are related to diabetes, hypertension, and obesity.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '1) Reduce your sodium intake (risk factor for hypertension):',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Watch your sodium intake and limit it to 2300 mg (equal to one teaspoon) per day. Avoid food with high sodium contents which includes:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '- Sauces',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '- Salted snacks',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '- Processed food such as sausages and Mortadella.',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '- Canned food',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '- Fast food and restaurant food',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '2) Cut back on sugars:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Studies have shown that sugar is a risk factor for obesity and diabetes.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '- Reduce your sugar intake and white carbohydrates (such as bread, rice, and pasta).',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "- Read food labels since many foods contain sugar even if they aren't considered to be sweet (e.g., ketchup).",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '- Avoid sweeteners.',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '3) Avoid sodas/carbonated water:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Since these contain high amounts of sugar. They also have kidney-damaging phosphorus additive and offer no nutritional value.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '4) Prepare your own food:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'When you make your own meals, you can choose whole grains, fruits, and vegetables that are minimally processed.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '5) Drink enough fluids especially during hot weather:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '(Tea and coffee are considered as diuretics.)',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '6) Avoid animal protein from saturated fats:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Researchers are still studying the relationship between high protein diets and chronic kidney disease. While you shouldn\'t avoid proteins or even fats, you should reduce the amount of red meat, full-fat dairy, and saturated fats that you eat to only a few times a week. If you develop kidney disease, your kidneys will work harder to break down the waste from eating and digesting meat.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '7) Eat unsaturated fats:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Unsaturated fats, such as monounsaturated fatty acids and polyunsaturated fatty acids (which includes healthy omega-3 fatty acids), can reduce your cholesterol. Lowering your cholesterol can reduce your risk for heart disease, which can cause kidney disease.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Eat:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '- Nuts and seeds',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '- Olive oils',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '- Avocados',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '- Salmon and sardines',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                    SizedBox(height: 20),
                    Text(
                        'Part Two: Healthy Lifestyle',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '1) Exercise:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Being overweight or obese can increase your risk for chronic kidney disease. Try to get at least 150 minutes of moderate exercise every week.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '2) Avoid tobacco:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'You might think smoking damages the lungs the most, but it can cause heart disease. Heart disease, strokes, and heart attacks will make your kidneys work harder and can cause kidney disease. Fortunately, stopping smoking can slow the development of kidney disease.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 20),
                    Text(
                        'Part Three: Avoid triggering factors',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '1) Use pain medications correctly:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Analgesics and nonsteroidal anti-inflammatory drugs can damage your kidneys if you take a high dose for an extended period of time. Taking a high dose for a short period of time can temporarily reduce kidney function.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    Text(
                        '- Follow the manufacturer\'s dosing instructions.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    Text(
                        '- If you are using non-steroidal anti-inflammatory drugs for an extended period, check your kidney function more frequently.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    Text(
                        '- Emergency rooms and urgent care units tend to give intravenous non-steroidal anti-inflammatory drugs for fever and pain control. Be aware of this fact and always inform your physician if you have chronic kidney disease or if you are at risk.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'If you have chronic kidney disease or you are at risk of chronic kidney disease, try to avoid non-steroidal anti-inflammatory drugs.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        '2) Be cautious with herbal supplements:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Certain herbal supplements, including krill oil, milk thistle, and St. John\'s wort, can cause kidney damage. Consult your doctor before taking any herbal supplements, especially if you have chronic kidney disease.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),
                    SizedBox(height: 20),
                    Text(
                        'Remember:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'It\'s important to consult with a healthcare professional or a registered dietitian for personalized advice and guidance on managing kidney health.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                    ),

                          ],
    ),
                      ),
    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
