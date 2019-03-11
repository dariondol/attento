Experiment()
{
  Context()
  {
    AssignmentGroup()
    {
      SessionGroup = 2;
      ExperimentName = lang2("Full Report from Iconic Memory (Sperling, 1960)", "Ganzbericht aus dem Ikonischen Gedächtnis (Sperling, 1960)");
      JavaClassName = "IconicMemoryExperiment.java";
      DataFileTrialFormat = "%SubjectCode% %TrialCounter% %SessionGroup% %Trial.CuedLetterMatrix.CuePosition% %Trial.LetterMatrixResponse.NumberCorrect%";
      TrialFactor = 2;
      SubjectCode = "pxlab119";
      RandomizeTrials = 1;
      StopKey = de.pxlab.pxl.KeyCodes.ENTER_KEY;
      new IntroWhole = lang2(["Ricordati le lettere\n \nVedrai apparire sullo schermo una matrice di lettere (consonanti) che rimarranno sullo schermo per poco tempo.\nIl tuo compito è cercare di ricordare le lettere che hai visto e digitarle sulla tastiera cercando di mantenere le medesime posizioni.\n Usa le frecce della tastiera per decidere la posizione della lettera (oppure digitale in ordine).\n Appena hai finito di digitare tutte le lettere, spingi il tasto invio.\n \n Per far apparire una nuova matrice di lettere premi un tasto.\nPremi un tasto per iniziare!"],["Experiment zum sensorischen Speicher: Ganzbericht", " ", "Wenn die Marke erscheint und Sie bereit sind, dann drücken Sie bitte eine Taste.", "Darauf erscheint eine Buchstabenmatrix aus Konsonanten.", "Anschließend geben Sie für jede Position möglichst den korrekten Buchstaben ein.", "Mit den Cursortasten können Sie den Cursor bewegen.", "Sie sollen an jeder Position ein Zeichen eingeben, auch wenn Sie unsicher sind.", "Die Eingabe wird mit der Return-Taste abgeschlossen.", " ", "Zum Starten bitte eine beliebige Taste drücken!"]);
      new IntroPartial = lang2(["Partial Report from Iconic Memory\n \nPress any key, if the cross appears and you are ready.\nWe show you a matrix of letters (consonants) and  after a short time, a row will be marked.\nAfter that, please try to reconstruct the row\n Use the cursor keys to move the cursor.\n Please enter for every position in the row a letter, even then if you are not sure!\n The Return-key will terminate your response.\n \nPress any key to start! "],["Experiment zum sensorischen Speicher: Teilbericht", " ", "Wenn die Marke erscheint und Sie bereit sind, dann drücken Sie bitte eine Taste.", "Darauf erscheint eine Buchstabenmatrix aus Konsonanten und kurz danach wird eine der beiden Zeilen markiert.", "Anschließend geben Sie für jede Position der markierten Zeile möglichst den korrekten Buchstaben ein.", "Mit den Cursortasten können Sie den Cursor bewegen.", "Sie sollen an jeder Position ein Zeichen eingeben, auch wenn Sie unsicher sind.", "Die Eingabe wird mit der Return-Taste abgeschlossen.", " ", "Zum Starten bitte eine beliebige Taste drücken!"]);
    }
    Session( Trial.CuedLetterMatrix.CueSize, Trial.LetterMatrixResponse.ResponseRows, Trial.LetterMatrixResponse.FirstResponseRow, Message.Text, SessionEnd.Message.Text)
    {
      Message()
      {
        FontSize = 26;
        Alignment = 0;
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
        Duration = 1000;
        FontFamily = "SansSerif";
        FontStyle = de.pxlab.pxl.FontStyleCodes.PLAIN;
        Text = "A Paragraph of Text presented by PXLab";
        Width = 800;
        Wrapping = 1;
        LocationX = 0;
        LocationY = 0;
        ReferencePoint = de.pxlab.pxl.PositionReferenceCodes.MIDDLE_CENTER;
        LineSkipFactor = 1;
      }
    }
    SessionEnd()
    {
      Message()
      {
        Duration = 1000;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        FontFamily = "SansSerif";
        FontStyle = de.pxlab.pxl.FontStyleCodes.PLAIN;
        FontSize = 60;
        Text = "A Paragraph of Text presented by PXLab";
        Width = 800;
        Wrapping = 1;
        LocationX = 0;
        LocationY = 0;
        LineSkipFactor = 1;
      }
    }
    Block( StoreData)
    {
      Message()
      {
        FontSize = 36;
        Text = lang2(["Premi un tasto per iniziare!"],["Zum Weitermachen\nbitte eine Taste drücken"]);
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
        FontFamily = "SansSerif";
        FontStyle = de.pxlab.pxl.FontStyleCodes.PLAIN;
        Width = 800;
        Wrapping = 1;
        LocationX = 0;
        LocationY = 0;
        LineSkipFactor = 1;
      }
      ClearScreen:blockStart()
      {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 500;
      }
    }
    BlockEnd()
    {
      Message()
      {
        FontSize = 36;
        Text = "P A U S A";
        Duration = 1000;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        FontFamily = "SansSerif";
        FontStyle = de.pxlab.pxl.FontStyleCodes.PLAIN;
        Width = 800;
        Wrapping = 1;
        LocationX = 0;
        LocationY = 0;
        LineSkipFactor = 1;
      }
    }
    Trial( TrialCounter, CuedLetterMatrix.Letters, LetterMatrixResponse.Letters, CuedLetterMatrix.CuePosition, LetterMatrixResponse.NumberCorrect)
    {
      FixationMark()
      {
        Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
        Size = 20;
        LineWidth = 3;
      }
      ClearScreen:wait1()
      {
        Duration = 2000;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
      }
      CuedLetterMatrix()
      {
        Duration = 1000;
        CueDelayDuration = 20;
        CueDuration = 280;
        NumberOfRows = 1;
        NumberOfColumns = 3;
        Width = 300;
        Height = 240;
        FontSize = 80;
        LocationY = -30;
        CueOrientation = 1;
        CuePosition = 0;
        Execute = 1;
        Overlay = 0;
        Timer = de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER;
        SetOfLetters = "abcdefghilmnopqrstuvzxyk";
        Letters = "";
        LocationX = 0;
        FontFamily = "SansSerif";
        FontStyle = 0;
        CueDistance = 50;
        CueSize = 0;
        CueDelayTimer = 1;
        CueDelayStopCode = 0;
        CueTimer = 1;
      }
      ClearScreen:wait2()
      {
        Duration = 300;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
      }
      LetterMatrixResponse()
      {
        NumberOfRows = 1;
        NumberOfColumns = 3;
        Width = 300;
        Height = 240;
        FontSize = 80;
        LocationY = -30;
        CorrectLetters = Trial.CuedLetterMatrix.Letters;
        FirstResponseColumn = 0;
        ResponseColumns = 3;
        Execute = 1;
        Overlay = 0;
        Timer = de.pxlab.pxl.TimerCodes.STOP_KEY_TIMER;
        Duration = 1000;
        SetOfLetters = "abcdefghilmnopqrstuvzxyk";
        Letters = "";
        LocationX = 0;
        FontFamily = "SansSerif";
        FontStyle = 0;
        UpperCase = 0;
        ResponseRows = 1;
        FirstResponseRow = 0;
        NumberCorrect = 0;
      }
      LetterMatrix()
      {
        Letters = Trial.CuedLetterMatrix.Letters;
        NumberOfRows = 1;
        NumberOfColumns = 3;
        Width = 300;
        Height = 240;
        FontSize = 80;
        LocationY = -30;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
        SetOfLetters = "abcdefghilmnopqrstuvzxyk";
        LocationX = 0;
        FontFamily = "SansSerif";
        FontStyle = 0;
      }
      Feedback()
      {
        Text = "%Trial.LetterMatrixResponse.NumberCorrect% ricordate correttamente";
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 1000;
        FontFamily = "SansSerif";
        FontStyle = de.pxlab.pxl.FontStyleCodes.PLAIN;
        FontSize = 60;
        Width = 800;
        Wrapping = 1;
        LocationX = 0;
        LocationY = 0;
        LineSkipFactor = 1;
        ResponseParameter = "ResponseCode";
        TargetParameter = "ResponseCode";
        CorrectCode = 255;
        CorrectText = "";
        FalseText = "";
        TimeOutText = "Hai finito il tempo!";
        SelectionSet = [0, 1];
        Evaluation = 0;
        CheckTimeOut = 0;
        Visible = 1;
        Protocol = 0;
      }
      ClearScreen:close()
      {
        Duration = 300;
        Timer = de.pxlab.pxl.TimerCodes.LIMITED_RESPONSE_TIMER;
      }
    }
  }
  Procedure()
  {
    Session( 30, 1, Trial.CuedLetterMatrix.CuePosition, IntroPartial, "Ende des ersten Teils")
    {
      Block( 0)
      {
        Trial( ?, ?, ?, 0, ?);
        Trial( ?, ?, ?, 1, ?);
      }
      Block( 1)
      {
        Trial( ?, ?, ?, 0, ?);
        Trial( ?, ?, ?, 0, ?);
        Trial( ?, ?, ?, 0, ?);
        Trial( ?, ?, ?, 1, ?);
        Trial( ?, ?, ?, 1, ?);
        Trial( ?, ?, ?, 1, ?);
      }
    }
    Session( 0, 2, 0, IntroWhole, "Ende")
    {
      Block( 0)
      {
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
      }
      Block( 1)
      {
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
        Trial( ?, ?, ?, ?, ?);
      }
    }
  }
}
