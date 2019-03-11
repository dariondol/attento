Experiment() {

  Context() {

    AssignmentGroup() {
      ExperimentName = lang2("Rispondi al segnale!", "Reaktionszeit auf akustische und optische Signale");
      SubjectCode = "pxlab26";
      TrialFactor = 1;
      new SignalType = 0;
    }

    Session:Optical(SignalType) {
      Instruction() {
        Text = lang2(["Rispondi al segnale!",
		" ",
		"QUESTO GIOCO DEVE ESSERE FATTO CON POCA LUCE, QUINDI, ABBASSA LA LUMINOSITA' DELLA STANZA. Vedrai una croce seguita da un punto. Premi il tasto del mouse piu' veloce possibile appena vedi il punto.", 
		" ",
		"Premi un tasto per iniziare!"],["Reaktionszeit auf ein optisches Signal\n \nSie werden nach dem Kreuz ein optisches Signal (Punkt) sehen.\n Drücken Sie die Maustaste so schnell wie möglich wenn Sie den Punkt sehen!\n \nZum Starten bitte Taste drücken!"]);
      }
    }

    SessionEnd:Optical() {
      SessionEndMessage();
    }

    Session:Acoustic(SignalType) {
      Instruction() {
        Text = lang2(["Rispondi al suono!",
		" ",
		"QUESTO GIOCO DEVE ESSERE FATTO CON POCA LUCE, QUINDI, ABBASSA LA LUMINOSITA' DELLA STANZA. Vedrai una croce seguita da un suono. Premi il tasto del mouse piu' velocemente possibile appena senti il suono.", 
		" ",
		"Premi un tasto per iniziare!"],
		["Reaktionszeit auf einen akustischen Reiz\n \nSie werden einen akustischen Reiz hören, nachdem ein Kreuz auf dem Bildschirm erschien.\nBitte drücken Sie die Maustaste so schnell wie möglich wenn Sie diesen Reiz hören.\n \nZum Starten bitte Taste drücken!"]);
      }
    }

    SessionEnd:Acoustic() {
      SessionEndMessage() {
	Text = "P A U S A";
      }
    }

    Block(StoreData, TrialFactor) {
    }

    Trial:Optical(SubjectCode, SignalType, ClearScreenRandomTime.Duration, SimpleDisk.ResponseTime) {
      ClearScreen()
      {
        Timer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        Duration = 500;
      }
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 300;
      }
      ClearScreen:WaitSignal()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
      ClearScreenRandomTime()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        ExpectedWait = 1000;
        WaitingTimeLimit = 3500;
        Duration = 3000;
      }
      SimpleDisk() {
        Timer = de.pxlab.pxl.TimerCodes.VS_RESPONSE_TIMER;
       Size = idiv(screenWidth(),70);
	Color = [0.04, 0.04, 0.3];
        LocationX = -screenWidth()/2;
        LocationY = screenHeight()/3;
      }
      Feedback()
      {
        Text = "%Trial:Optical.SimpleDisk.ResponseTime@i% ms";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
      }
    }

    Trial:Acoustic(SubjectCode, SignalType, ClearScreenRandomTime.Duration, ResponseTime) {
      ClearScreen()
      {
        Timer = de.pxlab.pxl.TimerCodes.VS_CLOCK_TIMER;
        Duration = 500;
      }
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 300;
      }
      ClearScreen:WaitSignal()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 400;
      }
      ClearScreenRandomTime()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        ExpectedWait = 1000;
        WaitingTimeLimit = 3500;
        Duration = 3000;
      }
      SyntheticSound() {
        Timer = de.pxlab.pxl.TimerCodes.END_OF_MEDIA_TIMER | de.pxlab.pxl.TimerCodes.START_RESPONSE_TIMER;
        Gain = 1.0;
        Duration = 100;
	Channels = 1;
        QuietLead = 0;
        Envelope = de.pxlab.pxl.SoundEnvelopeCodes.CONSTANT;
        Wave = de.pxlab.pxl.SoundWaveCodes.PURE_TONE;
        WavePars = 600;
      }
      ClearScreen:Response()
      {
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER | de.pxlab.pxl.TimerCodes.STOP_RESPONSE_TIMER;
      }
      Feedback()
      {
        Text = "%ResponseTime@i% ms";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
      }
    }

  }

  Procedure() {
    Session:Acoustic(0) {
      Block(0, 2) {
        Trial:Acoustic(?, ?, ?, ?);
      }
      Block(1, 4) {
        Trial:Acoustic(?, ?, ?, ?);
      }
    }
    Session:Optical(0) {
      Block(0, 2) {
        Trial:Optical(?, ?, ?, ?);
      }
      Block(1, 4) {
        Trial:Optical(?, ?, ?, ?);
      }
    }
  }
}


