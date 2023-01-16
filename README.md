# Reemp

This project is a test for a job interview.

To run a flutter app, you need to have flutter installed on your machine. You can find the installation guide [here](https://flutter.dev/docs/get-started/install).

## How to run

To run the app, you need to run the following command:

```bash
flutter run
```

## How to test

To run the tests, you need to run the following command:

```bash
flutter test
```

## How to build

To build the app, you need to run the following command:

```bash
flutter build apk
```

This app contains a circular menu with 4 buttons. 

This is a custom widget that I created. It is a circular menu with 4 buttons. It is possible to add more buttons, but the menu will not be circular anymore.

The menu is animated. It is possible to change the animation duration and the animation curve.

The menu is also draggable. It is possible to change the drag sensitivity.

The menu is also responsive. It is possible to change the size of the menu.

I have a circleSelected variable that is used to know which button is selected. It is possible to change the color of the selected button.

I have a circleSelectedCallback variable that is used to know which button is selected. It is possible to change the color of the selected button.



This function is used to create the position map. It is used to know where the buttons will be placed.

```
  void createPositionMap() {
    final sizeScreen = widget.sizeScreen;
    final middleSreen = (sizeScreen.width - 32) / 2;
    final midleMiddleScreen = middleSreen / 2;
    final midleCircle = widget.sizeCircle / 2;
    final midleCircleSelected = widget.sizeCircleSelected / 2;
    final midleForCircleNormal = middleSreen - midleCircle;
    final midleForCircleSelected = middleSreen - midleCircleSelected;
    final leftCicle = midleMiddleScreen - midleCircle;
    final rightCircle = middleSreen + midleMiddleScreen - midleCircle;
    circlePositionFinals[1] = CirclePositionModel(
      left: midleForCircleNormal,
      top: 10,
    );
    circlePositionFinals[2] = CirclePositionModel(
      left: rightCircle,
      top: 10 + widget.sizeCircle,
    );
    circlePositionFinals[3] = CirclePositionModel(
      left: midleForCircleSelected,
      top: 10 + (widget.sizeCircle * 2),
    );
    circlePositionFinals[4] = CirclePositionModel(
      left: leftCicle,
      top: 10 + widget.sizeCircle,
    );
    initPositions();
  }
```

I created 2 methods to move the circles (moveToRogth - moveToLeft)

```
  void moveToRigth() {
    if (positionsCircles == 4) {
      positionsCircles = 1;
      positionsCirclesSecond = 2;
      positionsCirclesThird = 3;
      positionsCirclesFourth = 4;
      circleSelected = 3;
    } else {
      switch (positionsCircles) {
        case 1:
          positionsCircles = 2;
          positionsCirclesSecond = 3;
          positionsCirclesThird = 4;
          positionsCirclesFourth = 1;
          circleSelected = 2;
          break;
        case 2:
          positionsCircles = 3;
          positionsCirclesSecond = 4;
          positionsCirclesThird = 1;
          positionsCirclesFourth = 2;
          circleSelected = 1;
          break;
        case 3:
          positionsCircles = 4;
          positionsCirclesSecond = 1;
          positionsCirclesThird = 2;
          positionsCirclesFourth = 3;
          circleSelected = 4;
          break;
        case 4:
          positionsCircles = 1;
          positionsCirclesSecond = 2;
          positionsCirclesThird = 3;
          positionsCirclesFourth = 4;
          circleSelected = 3;
          break;
        default:
      }
    }
    updatePositionsAnimations();
    _controllerFirstCircle.forward();
  }
```

This methods updates the position of the circles and animates them.

I consider that the circleSelected is the circle that is in the middle of the screen. The other circles are in the left, right, top and bottom of the screen.

