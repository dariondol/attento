/*@
<body>
<h4>Stroop Interference</h4>

<p> Colored words or letter sequences are presented together with a
color name below.  The task is to respond with the YES-key if the
color name gives the name of the letter colors shown or with the NO-key if
not.  The colored letters or words words are either congruent to their color,
incongruent, or are neutral distractors.  
*/

Experiment() {

  Context() {

    AssignmentGroup() {
    new ROSSO =   [ 13.37, 0.519, 0.268];
    new GIALLO =  [ 47.34, 0.429, 0.485];
    new VERDE = [ 20.20, 0.257, 0.442];
    new BLU =  [ 16.44, 0.175, 0.155];
    new GRIGIO = gray();

    new R_JA = 0;
    new R_NEIN = 1;

    new Interference = 0;
    new NEUT = 0;
    new KON = 1;
    new INKON = 2;
    
	ExperimentName = lang2("Abbina colori e parole (Stroop, 1935)", "Farbe-Wort-Interferenz (Stroop, 1935)");
	SubjectCode = "pxlab52"; 
	DataFileTrialFormat = "%SubjectCode% %TrialCounter% %Interference% %Trial.Feedback.Response% %Trial.TwoStrings.ResponseTime%";
	new TrialReplicator = 0;
    }

	Session() {
		Instruction() {
	        	Text = ["Abbina colori e colori", " ", 
			"Sullo schermo vedrai apparire delle sequenze di lettere nella prima riga, e un colore (scritto in parola) nella seconda riga.",
			"Se il colore scritto nella seconda riga corrisponde al colore con cui è scritta la sequenza di lettere che appare nella prima riga, allora clicca il tasto sinistro del mouse.", 
			"Se il colore della seconda riga non corrisponde al colore con cui è scritta la parola nella prima riga, allora clicca il tasto destro del mouse.",
			"Devi rispondere più velocemente possibile e cliccare un tasto qualsiasi ogni volta che vorrai andare avanti con il gioco!",
			" ", "Premi un tasto per cominciare!"];
		}
    	}	

	SessionEnd() {
		Message() {
			Text = "F I N E";
			Duration = 2000;
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
		}
	}


    	Block(StoreData) {
		Message() {
			Text = "Adesso prova ancora!";
			Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
		}
	}

    	BlockEnd() {
		Message() {
			Text = "P A U S A";
			Duration = 2000;
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
		}
	}

	Trial(TrialCounter, 
	    TrialReplicator, 
	    TwoStrings.SignalText,
	    TwoStrings.ProbeText,
	    TwoStrings.SignalColor,
	    Interference, 
	    Feedback.CorrectCode, 
	    Feedback.Response, 
	    TwoStrings.ResponseTime) {
		FixationMark() {
			Timer = de.pxlab.pxl.TimerCodes.RELEASE_RESPONSE_TIMER;
			LineWidth = 3;
		}
		ClearScreen:wait1() {
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 500;
		}
		TwoStrings() {
			SOADuration = 100;
			SignalSize = 140;
			Duration = 5000;
			SignalLocationX = 0;
			SignalLocationY = -45;
			ProbeColor = gray();
			ProbeSize = 140;
			ProbeLocationX = 0;
			ProbeLocationY = 148;
			ResponseSet = [1, 3];
		}
		Feedback() {
			ResponseParameter = "Trial.TwoStrings.ResponseCode";
			CorrectText = "%Trial.TwoStrings.ResponseTime@i% ms";
			Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
			FalseText = "Ops! Sbagliato!";
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 1200;
			Visible = 1;
		}
		ClearScreen:wait2() {
			Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
			Duration = 1000;
		}
	}

  }

  Procedure() {

    Session() {

      /* Übung: 4 x 12 = 48 trials */

      Block(0) {

	Trial(?, 1, <"TVBE", "WNW">, "ROSSO", ROSSO, INKON, R_JA, ?, ?);
	Trial(?, 1, <"GHTN", "BBRT">, "GIALLO", ROSSO, INKON, R_NEIN, ?, ?);
	Trial(?, 1, <"DRFG", "NSLG">, "ROSSO", ROSSO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"KNPL", "TTMM">, "GIALLO", ROSSO, NEUT, R_NEIN, ?, ?);
	Trial(?, <1,2>, "RGFYT", "ROSSO", ROSSO, KON, R_JA, ?, ?);
	Trial(?, 1, <"BNRT", "POTSH">, "ROSSO", ROSSO, KON, R_JA, ?, ?);

	Trial(?, 1, <"XVET", "KDJF">, "VERDE", VERDE, INKON, R_JA, ?, ?);
	Trial(?, 1, <"KSHGF", "DSFVBVD">, "BLU", VERDE, INKON, R_NEIN, ?, ?);
	Trial(?, 1, <"TGZW", "LNVT">, "VERDE", VERDE, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"NTFH", "CSNG">, "GIALLO", VERDE, NEUT, R_NEIN, ?, ?);
	Trial(?, <1,2>, "RHDTS", "VERDE", VERDE, KON, R_JA, ?, ?);
	Trial(?, 1, <"HFSD", "NDRYI">, "VERDE", VERDE, KON, R_JA, ?, ?);

	Trial(?, 1, <"KHRXY", "KITDD">, "GIALLO", GIALLO, INKON, R_JA, ?, ?);
	Trial(?, 1, <"LIFCR", "KLJDF">, "BLU", GIALLO, INKON, R_NEIN, ?, ?);
	Trial(?, 1, <"DNRH", "FRVN">, "GIALLO", GIALLO, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"RDNR", "HFGL">, "ROSSO", GIALLO, NEUT, R_NEIN, ?, ?);
	Trial(?, <1,2>, "RJDXHN", "GIALLO", GIALLO, KON, R_JA, ?, ?);
	Trial(?, 1, <"LKBCR", "KJD">, "GIALLO", GIALLO, KON, R_JA, ?, ?);

	Trial(?, 1, <"JGCT", "BXSRY">, "BLU", BLU, INKON, R_JA, ?, ?);
	Trial(?, 1, <"YVCS", "KJJBC">, "ROSSO", BLU, INKON, R_NEIN, ?, ?);
	Trial(?, 1, <"RHSR", "PMRH">, "BLU", BLU, NEUT, R_JA, ?, ?);
	Trial(?, 1, <"NSRG", "GNDN">, "ROSSO", BLU, NEUT, R_NEIN, ?, ?);
	Trial(?, <1,2>, "ABDGT", "BLU", BLU, KON, R_JA, ?, ?);
	Trial(?, 1, <"KNCDSE", "JHNHX">, "BLU", BLU, KON, R_JA, ?, ?);
      }
    }
  }
}
/*@</body>*/

