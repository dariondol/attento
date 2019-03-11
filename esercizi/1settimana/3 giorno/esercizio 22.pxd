Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab22";
    }

    Session() {
      Instruction() {
        Text = ["PAROLA O NON PAROLA?",
		" ",
		"VEDRAI DUE SEQUENZE DI LETTERE. UNA E' UNA PAROLA VERA E L'ALTRA NON E' UNA PAROLA. DEVI TROVARE LA PAROLA VERA E CLICCARE IL TASTO DESTRO DEL MOUSE SE LA PAROLA VERA E' A DESTRA, IL TASTO DI SINISTRA SE LA PAROLA VERA E' A SINISTRA. CERCA DI ESSERE PIU' VELOCE CHE PUOI.",
		" ",
		"PREMI UN TASTO PER PARTIRE!"];  
      }
    }

    SessionEnd() {
      SessionEndMessage();
    }

    Trial(TextParagraphMultiple.Text, Feedback.CorrectCode, Feedback.Response, TextParagraphMultiple.ResponseTime) {
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 50;
      }
      FixationMark:B() {
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
      }
      TextParagraphMultiple() {
	Overlay = de.pxlab.pxl.OverlayCodes.JOIN;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
	ResponseSet = [1,3];
	FontSize = idiv(screenWidth(),15);
	ReferencePoint = [de.pxlab.pxl.PositionReferenceCodes.BASE_RIGHT, 
		de.pxlab.pxl.PositionReferenceCodes.BASE_LEFT];
	LocationX = arrayOf2(-screenWidth()/4.1, screenWidth()/4.1);
	LocationY = 25;
      }
      Feedback() {
	ResponseParameter = "Trial.TextParagraphMultiple.ResponseCode";
	CorrectText = "Corretto!\n %Trial.TextParagraphMultiple.ResponseTime@i% ms";
	FalseText = "Ops! Sbagliato!";
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 1000;
      }
    }
  }

  Procedure() {
    Session() {
      Block() {
	Trial(["pomata", "bOMATA"], 0, ?, ?);
	Trial(["bossolo", "dOSSOLO"], 0, ?, ?);
	Trial(["forfora", "vORVORA"], 0, ?, ?);
	Trial(["valvola", "fALVOLA"], 0, ?, ?);
	Trial(["carciofo", "gARGIOFO"], 0, ?, ?);
	Trial(["ciliegia", "cHILGIEGIA"], 0, ?, ?);
	Trial(["giaguaro", "gIACUARO"], 0, ?, ?);
	Trial(["pinguino", "bINGUINO"], 0, ?, ?);
	Trial(["befana", "pEFANA"], 0, ?, ?);
	Trial(["tariffa", "fATIffA"], 0, ?, ?);
	Trial(["tassello", "dASSELLO"], 0, ?, ?);
	Trial(["cinghiale", "gINGHIALE"], 0, ?, ?);
	Trial(["catino", "gATINO"], 0, ?, ?);
	Trial(["cofano", "gOTANO"], 0, ?, ?);
	Trial(["lumaca", "lUMATA"], 0, ?, ?);
	Trial(["ORTIga", "ortica"], 1, ?, ?);
	Trial(["caBArra", "caparra"], 1, ?, ?);
	Trial(["GRAtere", "cratere"], 1, ?, ?);
	Trial(["SAnzara", "zanzara"], 1, ?, ?);
	Trial(["zaFFera", "zattera"], 1, ?, ?);
	Trial(["GAlcagno", "calcagno"], 1, ?, ?);
	Trial(["SGAffale", "scaffale"], 1, ?, ?);
	Trial(["GOmeta", "cometa"], 1, ?, ?);
	Trial(["GANguro", "canguro"], 1, ?, ?);
	Trial(["ofATTA", "ovatta"], 1, ?, ?);
	Trial(["Adicola", "edicola"], 1, ?, ?);
	Trial(["furCONE", "furgone"], 1, ?, ?);
	Trial(["CEranio", "geranio"], 1, ?, ?);
	Trial(["NARtire", "martire"], 1, ?, ?);
	Trial(["GIpresso", "cipresso"], 1, ?, ?);
      }
    }
  }
}
