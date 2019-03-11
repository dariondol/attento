Experiment() {

  Context() {

    AssignmentGroup() {
      ExperimentName = "Response Position Recording";
      SubjectCode = "pxlab37";
      TrialFactor = 10;
      new targetPosition = arrayOf2(Trial.SimpleDisk.LocationX, Trial.SimpleDisk.LocationY);
    }

    Session() {
      Instruction() {
	Text = ["Hit the Target", 
		" ",
		"Quando il punto compare tu clicca su di esso piu' velocemente che puoi.",
		" ",
		"Dopo la risposta corretta ti viene data la distanza dal centro e il tempo. Tanto piu' bassi sono i valori tanto piu' bravo diventi!!.",
		" ",
		"Premi un tasto per iniziare!"]; 
      }
    }

    SessionEnd() {
      SessionEndMessage();
    }

    Trial(TrialCounter, 
	SimpleDisk.Color, 
	SimpleDisk.LocationX, SimpleDisk.LocationY, 
	SimpleDisk.ResponseTime, SimpleDisk.ResponsePosition,
	Feedback.Response) {
      RandomGenerator:X() {
	DistributionType = de.pxlab.pxl.RandomGeneratorCodes.EQUAL_DISTRIBUTION_INT;
	LowerLimit = -screenWidth()/2;
        UpperLimit = screenWidth()/2;
      }
      RandomGenerator:Y() {
	DistributionType = de.pxlab.pxl.RandomGeneratorCodes.EQUAL_DISTRIBUTION_INT;
	LowerLimit = -screenHeight()/4;
        UpperLimit = screenHeight()/4;
      }
      SimpleDisk() {
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
        Size = idiv(screenWidth(),80);
	LocationX = Trial.RandomGenerator:X.ResponseCode;
	LocationY = Trial.RandomGenerator:Y.ResponseCode;
      }
      Feedback() {
	Evaluation = de.pxlab.pxl.EvaluationCodes.POSITION;
	ResponseParameter = "Trial.SimpleDisk.ResponsePosition";
	TargetParameter = "targetPosition";
	CorrectCode = 50;
	CorrectText = "Preso!\n \nCenter Distance: %Trial.Feedback.Response@i% Pixels\nTime: %Trial.SimpleDisk.ResponseTime@i% ms";
	FalseText = "ops!sbagliato!";
	Visible = 1;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 1200;
      }
    }
  }

  Procedure() {
    Session() {
      Block() {
        Trial(?, LightGray, ?, ?, ?, ?, ?);
        Trial(?, Red, ?, ?, ?, ?, ?);
        Trial(?, Green, ?, ?, ?, ?, ?);
        Trial(?, Blue, ?, ?, ?, ?, ?);
        Trial(?, Yellow, ?, ?, ?, ?, ?);
      }
    }
  }
}

