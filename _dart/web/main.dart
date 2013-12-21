import 'dart:core';
import 'dart:html';
import 'dart:async';

DivElement topStripe;
DivElement topMargin;
DivElement mainContent;
DivElement bottomStripe;
DivElement bottomMargin;

int decorationHeight;
int bottomMarginHeight;

void main() {
  topStripe    = querySelector("#bottomStripe");
  print(topStripe);
  topMargin    = querySelector("#bottomMargin");
  print(topMargin);
  mainContent  = querySelector("#main");
  print(mainContent);
  bottomStripe = querySelector("#bottomStripe");
  print(bottomStripe);
  bottomMargin = querySelector("#bottomMargin");
  print(bottomMargin);

  decorationHeight = topStripe.offsetHeight + topMargin.offsetHeight + bottomStripe.offsetHeight;
  bottomMarginHeight = bottomMargin.offsetHeight;

  window.onResize.listen(setBottomStripePosition);
  setBottomStripePosition();
  checkHeight();
}

int seconds = 0;

void checkHeight() {
  Timer t = new Timer(new Duration(seconds:1), () {
    setBottomStripePosition();
    if (seconds < 30) {
      seconds++;
      checkHeight();
    }
  });
}

void setBottomStripePosition([Event e]) {
  int totalHeight = decorationHeight + mainContent.offsetHeight;

  if (totalHeight + bottomMarginHeight < window.innerHeight) {
    if (window.innerHeight - totalHeight < 0) {
      bottomMargin.style.height = "2rem";
    } else {
      bottomMargin.style.height = "${window.innerHeight - totalHeight}px";
    }
  }
}