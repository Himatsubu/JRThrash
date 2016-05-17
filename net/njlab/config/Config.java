package net.njlab.config;

/**
 *  @author Keisuke Koike
 */

import java.io.File;
import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import net.njlab.tool.Manager;
import net.njlab.dump.*;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;



public class Config {

	String className;

	public Config(String className){

		this.className = className;
		String fileName = Manager.getCurrentPass()+"/config/"+className+"_config.xml";

		File file = new File(fileName);
		if (!file.exists()){
		    fileName = Manager.getCurrentPass()+"/config/default_config.xml";
		}

		file = new File(fileName);
		if (!file.exists())
			CompileMsgs.wdumpConfigFileNotFound(className);
		else
			System.out.println("---------- "+fileName+" read ----------\n");

        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document docment = builder.parse(file);
            Element config = docment.getDocumentElement();

            NodeList nodes;
            nodes = config.getElementsByTagName("bitWidth");
            setBitWidthConf((Element)nodes.item(0));
            setClockEnableConf(config);
            nodes = config.getElementsByTagName("IPcore");
            setIPcoreConf((Element)nodes.item(0));
            nodes = config.getElementsByTagName("generateCode");
            setGenCodeConf((Element)nodes.item(0));
            nodes = config.getElementsByTagName("chaining");
            setChainingConf((Element)nodes.item(0));
            nodes = config.getElementsByTagName("registerSharing");
            setRegisterSharingConf((Element)nodes.item(0));
            nodes = config.getElementsByTagName("scheduling");
            setSchedulingConf((Element)nodes.item(0));
       }
       catch( ParserConfigurationException e ) {
       }
       catch( SAXException e ) {
       }
       catch( IOException e ) {
       }
	}

	String removeSpace(String orig){
		orig = orig.replaceAll(" ", "");
		return orig.replaceAll("	", "");
	}

	int parseInt(String numString, int errorValue, String tagName){

		numString = removeSpace(numString);
		try{
			return Integer.parseInt(numString);
		}
		catch(NumberFormatException e){

			CompileMsgs.wdumpTagNotRead(tagName, errorValue+"");
			return errorValue;
		}
	}

	int getNumber(Element elem, String tagName, int defaultValue, int min){

		NodeList nodes;

		if(elem!=null && tagName!=null){
			nodes = elem.getElementsByTagName(tagName);

			if(nodes.item(0)!=null){
				if(nodes.item(0).getFirstChild() instanceof Text){
					try{
						int retNum = parseInt(((Text)nodes.item(0).getFirstChild()).getData(), defaultValue, nodes.item(0).getNodeName());
						if(retNum < min){
							CompileMsgs.wdumpMinOrMore(tagName, min);
							return min;
						}
						return retNum;
					}
					catch(Exception e){}
				}
			}
		}
		CompileMsgs.wdumpTagNotRead(tagName, defaultValue+"");
		return defaultValue;
	}

	String getName(Element elem, String tagName, String defaultName){

		NodeList nodes;

		if(elem!=null && tagName!=null){
			nodes = elem.getElementsByTagName(tagName);

			if(nodes.item(0)!=null){
				if(nodes.item(0).getFirstChild() instanceof Text){

					String name = ((Text)nodes.item(0).getFirstChild()).getData();
					name = removeSpace(name);
					if(name.compareTo("")==0){
						CompileMsgs.wdumpTagNotRead(tagName, defaultName);
						return defaultName;
					}
					return name;
				}
			}
		}
		CompileMsgs.wdumpTagNotRead(tagName, defaultName);
		return defaultName;
	}

	boolean getBool(Element elem, String tagName, boolean defaultValue){

		NodeList nodes;

		if(elem!=null && tagName!=null){
			nodes = elem.getElementsByTagName(tagName);

			if(nodes.item(0)!=null){
				if(nodes.item(0).getFirstChild() instanceof Text){

					String bool = ((Text)nodes.item(0).getFirstChild()).getData();
					bool = removeSpace(bool);
					if(bool.compareTo("true")==0){
						return true;
					}
					else if(bool.compareTo("false")==0){
						return false;
					}
					else{
						CompileMsgs.wdumpTagNotRead(tagName, defaultValue+"");
						return defaultValue;
					}
				}
			}
		}
		CompileMsgs.wdumpTagNotRead(tagName, defaultValue+"ko");
		return defaultValue;
	}

	void setBitWidthConf(Element elem){

		byteBitWidth = getNumber(elem, "byteBitWidth", byteBitWidth, 1);
		shortBitWidth = getNumber(elem, "shortBitWidth", shortBitWidth, 1);
		charBitWidth = shortBitWidth;
		intBitWidth = getNumber(elem, "intBitWidth", intBitWidth, 1);
		longBitWidth = getNumber(elem, "longBitWidth", longBitWidth, 1);

		if( !(byteBitWidth>=0 && byteBitWidth<=8 && shortBitWidth<=16 && intBitWidth<=32 && longBitWidth<=64) ){
			CompileMsgs.wdumpBitWidthSpec();
			byteBitWidth = 8;
			shortBitWidth = 16;
			charBitWidth = shortBitWidth;
			intBitWidth = 32;
			longBitWidth = 64;
		}
		if( !(byteBitWidth<shortBitWidth && shortBitWidth<intBitWidth && intBitWidth<longBitWidth) ){
			CompileMsgs.wdumpBitWidthSize();
			byteBitWidth = 8;
			shortBitWidth = 16;
			charBitWidth = shortBitWidth;
			intBitWidth = 32;
			longBitWidth = 64;
		}

		boolean floatingIsSingle = getBool(elem, "floatingIsSingle", true);
		if(floatingIsSingle)
			floatingType = singleType;
		else
			floatingType = doubleType;
	}

	void setClockEnableConf(Element elem){

		clockEnable = getBool(elem, "haveClockEnablePort", false);
	}

	void setIPcoreConf(Element elem){

		NodeList nodes;

		nodes = elem.getElementsByTagName("dualPortRam");
		setDpRamConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("addInt");
		setAddIntConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("multInt");
		setMultIntConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("divInt");
		setDivIntConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("compareIntLessThan");
		setCompareIntConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("addFloat");
		setAddFloatConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("multFloat");
		setMultFloatConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("divFloat");
		setDivFloatConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("compareFloatLessThan");
		setCompareFloatConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("fixedToFloat");
		setFixedToFloatConf((Element)nodes.item(0));
		nodes = elem.getElementsByTagName("floatToFixed");
		setFloatToFixedConf((Element)nodes.item(0));
	}

	void setDpRamConf(Element elem){

		bramLatency = getNumber(elem, "latency", bramLatency, 0);
		//bramThroughput = getNumber(elem, "throughput", bramThroughput);
		bramModuleName = getName(elem, "moduleName", bramModuleName);
		bramClk0Pname = getName(elem, "clk0Pname", bramClk0Pname);
		bramClk1Pname = getName(elem, "clk1Pname", bramClk1Pname);
		bramAddr0Pname = getName(elem, "addr0Pname", bramAddr0Pname);
		bramAddr1Pname = getName(elem, "addr1Pname", bramAddr1Pname);
		bramDataIn0Pname = getName(elem, "dataIn0Pname", bramDataIn0Pname);
		bramDataIn1Pname = getName(elem, "dataIn1Pname", bramDataIn1Pname);
		bramDataOut0Pname = getName(elem, "dataOut0Pname", bramDataOut0Pname);
		bramDataOut1Pname = getName(elem, "dataOut1Pname", bramDataOut1Pname);
		bramRorW0Pname = getName(elem, "RorW0Pname", bramRorW0Pname);
		bramRorW1Pname = getName(elem, "RorW1Pname", bramRorW1Pname);
		bramClkEnable0Pname = getName(elem, "clkEnable0Pname", bramClkEnable0Pname);
		bramClkEnable1Pname = getName(elem, "clkEnable1Pname", bramClkEnable1Pname);
		useBramLibrary = getBool(elem, "useGeneratedFile", useBramLibrary);
		isCommonClock = getBool(elem, "commonClock", isCommonClock);
	}

	void setAddIntConf(Element elem){

		addIntLatency = getNumber(elem, "latency", addIntLatency, 0);
		addIntThroughput = getNumber(elem, "throughput", addIntThroughput, 1);
		addIntUseIP = getBool(elem, "useIP", addIntUseIP);
		availableAddIntNum = getNumber(elem, "availableNum", availableAddIntNum, 1);
		addIntModuleName = getName(elem, "moduleName", addIntModuleName);
		addIntClkPort = getName(elem, "clkPname", addIntClkPort);
		addIntLeftPort = getName(elem, "leftOperandPname", addIntLeftPort);
		addIntRightPort = getName(elem, "rightOperandPname", addIntRightPort);
		addIntSumPort = getName(elem, "sumPname", addIntSumPort);
		addIntAddOrSub = getName(elem, "addOrSubPname", addIntAddOrSub);
		addIntLeftBitWidth = getNumber(elem, "leftPortBitWidth", addIntLeftBitWidth, 1);
		addIntRightBitWidth = getNumber(elem, "rightPortBitWidth", addIntRightBitWidth, 1);
		addIntSumBitWidth = getNumber(elem, "sumPortBitWidth", addIntSumBitWidth, 1);
		addIntHaveNewData = getBool(elem, "haveNewDataPort", addIntHaveNewData);
		addIntNewDataPort = getName(elem, "newDataPname", addIntNewDataPort);
		addIntClkEnPort = getName(elem, "clockEnablePname", addIntClkEnPort);
	}

	void setMultIntConf(Element elem){

		multIntLatency = getNumber(elem, "latency", multIntLatency, 0);
		multIntThroughput = getNumber(elem, "throughput", multIntThroughput, 1);
		multIntUseIP = getBool(elem, "useIP", multIntUseIP);
		availableMultIntNum = getNumber(elem, "availableNum", availableMultIntNum, 1);
		multIntModuleName = getName(elem, "moduleName", multIntModuleName);
		multIntClkPort = getName(elem, "clkPname", multIntClkPort);
		multIntMultiplicandPort = getName(elem, "multiplicandPname", multIntMultiplicandPort);
		multIntMultiplierPort = getName(elem, "multiplierPname", multIntMultiplierPort);
		multIntProductPort = getName(elem, "productPname", multIntProductPort);
		multIntMultiplicandBitWidth = getNumber(elem, "multiplicandBitWidth", multIntMultiplicandBitWidth, 1);
		multIntMultiplierBitWidth = getNumber(elem, "multiplierBitWidth", multIntMultiplierBitWidth, 1);
		multIntProductBitWidth = getNumber(elem, "productBitWidth", multIntProductBitWidth, 1);
		multIntHaveNewData = getBool(elem, "haveNewDataPort", multIntHaveNewData);
		multIntNewDataPort = getName(elem, "newDataPname", multIntNewDataPort);
		multIntClkEnPort = getName(elem, "clockEnablePname", multIntClkEnPort);
	}

	void setDivIntConf(Element elem){

		divIntLatency = getNumber(elem, "latency", divIntLatency, 0);
		divIntThroughput = getNumber(elem, "throughput", divIntThroughput, 1);
		divIntUseIP = getBool(elem, "useIP", divIntUseIP);
		availableDivIntNum = getNumber(elem, "availableNum", availableDivIntNum, 1);
		divIntModuleName = getName(elem, "moduleName", divIntModuleName);
		divIntClkPort = getName(elem, "clkPname", divIntClkPort);
		divIntDividendPort = getName(elem, "dividendPname", divIntDividendPort);
		divIntDivisorPort = getName(elem, "divisorPname", divIntDivisorPort);
		divIntQuotientPort = getName(elem, "quotientPname", divIntQuotientPort);
		divIntFractionalPort = getName(elem, "fractionalPname", divIntFractionalPort);
		divIntDividendBitWidth = getNumber(elem, "dividendBitWidth", divIntDividendBitWidth, 1);
		divIntDivisorBitWidth = getNumber(elem, "divisorBitWidth", divIntDivisorBitWidth, 1);
		divIntQuotientBitWidth = getNumber(elem, "quotientBitWidth", divIntQuotientBitWidth, 1);
		divIntFractionalBitWidth = getNumber(elem, "fractionalBitWidth", divIntFractionalBitWidth, 1);
		divIntHaveNewData = getBool(elem, "haveNewDataPort", divIntHaveNewData);
		divIntNewDataPort = getName(elem, "newDataPname", divIntNewDataPort);
		divIntClkEnPort = getName(elem, "clockEnablePname", divIntClkEnPort);
	}

	void setCompareIntConf(Element elem){

		intLessThanLatency = getNumber(elem, "latency", intLessThanLatency, 0);
		intLessThanThroughput = getNumber(elem, "throughput", intLessThanThroughput, 1);
		intLessThanUseIP = getBool(elem, "useIP", intLessThanUseIP);
		availableIntLessThanNum = getNumber(elem, "availableNum", availableIntLessThanNum, 1);
		cmpIntLtModuleName = getName(elem, "moduleName", cmpIntLtModuleName);
		cmpIntLtClkPort = getName(elem, "clkPname", cmpIntLtClkPort);
		cmpIntLtLeftPort = getName(elem, "leftOperandPname", cmpIntLtLeftPort);
		cmpIntLtRightPort = getName(elem, "rightOperandPname", cmpIntLtRightPort);
		cmpIntLtResultPort = getName(elem, "resultPname", cmpIntLtResultPort);
		cmpIntLtLeftBitWidth = getNumber(elem, "leftPortBitWidth", cmpIntLtLeftBitWidth, 1);
		cmpIntLtRightBitWidth = getNumber(elem, "leftPortBitWidth", cmpIntLtRightBitWidth, 1);
		intLessThanHaveNewData = getBool(elem, "haveNewDataPort", intLessThanHaveNewData);
		cmpIntLtNewDataPort = getName(elem, "newDataPname", cmpIntLtNewDataPort);
		cmpIntLtClkEnPort = getName(elem, "clockEnablePname", cmpIntLtClkEnPort);
	}

	void setAddFloatConf(Element elem){

		addFloatLatency = getNumber(elem, "latency", addFloatLatency, 0);
		addFloatThroughput = getNumber(elem, "throughput", addFloatThroughput, 1);
		availableAddFloatNum = getNumber(elem, "availableNum", availableAddFloatNum, 1);
		addFloatModuleName = getName(elem, "moduleName", addFloatModuleName);
		addFloatClkPort = getName(elem, "clkPname", addFloatClkPort);
		addFloatLeftPort = getName(elem, "leftOperandPname", addFloatLeftPort);
		addFloatRightPort = getName(elem, "rightOperandPname", addFloatRightPort);
		addFloatSumPort = getName(elem, "sumPname", addFloatSumPort);
		addFloatLeftBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		addFloatRightBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		addFloatSumBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		addFloatHaveNewData = getBool(elem, "haveNewDataPort", addFloatHaveNewData);
		addFloatNewDataPort = getName(elem, "newDataPname", addFloatNewDataPort);
		addFloatClkEnPort = getName(elem, "clockEnablePname", addFloatClkEnPort);

	}

	void setMultFloatConf(Element elem){

		multFloatLatency = getNumber(elem, "latency", multFloatLatency, 0);
		multFloatThroughput = getNumber(elem, "throughput", multFloatThroughput, 1);
		availableMultFloatNum = getNumber(elem, "availableNum", availableMultFloatNum, 1);
		multFloatModuleName = getName(elem, "moduleName", multFloatModuleName);
		multFloatClkPort = getName(elem, "clkPname", multFloatClkPort);
		multFloatMultiplicandPort = getName(elem, "multiplicandPname", multFloatMultiplicandPort);
		multFloatMultiplierPort = getName(elem, "multiplierPname", multFloatMultiplierPort);
		multFloatProductPort = getName(elem, "productPname", multFloatProductPort);
		multFloatMultiplicandBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		multFloatMultiplierBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		multFloatProductBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		multFloatHaveNewData = getBool(elem, "haveNewDataPort", multFloatHaveNewData);
		multFloatNewDataPort = getName(elem, "newDataPname", multFloatNewDataPort);
		multFloatClkEnPort = getName(elem, "clockEnablePname", multFloatClkEnPort);
	}

	void setDivFloatConf(Element elem){

		divFloatLatency = getNumber(elem, "latency", divFloatLatency, 0);
		divFloatThroughput = getNumber(elem, "throughput", divFloatThroughput, 1);
		availableDivFloatNum = getNumber(elem, "availableNum", availableDivFloatNum, 1);
		divFloatModuleName = getName(elem, "moduleName", divFloatModuleName);
		divFloatClkPort = getName(elem, "clkPname", divFloatClkPort);
		divFloatDividendPort = getName(elem, "dividendPname", divFloatDividendPort);
		divFloatDivisorPort = getName(elem, "divisorPname", divFloatDivisorPort);
		divFloatQuotientPort = getName(elem, "quotientPname", divFloatQuotientPort);
		divFloatDividendBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		divFloatDivisorBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		divFloatQuotientBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		divFloatHaveNewData = getBool(elem, "haveNewDataPort", divFloatHaveNewData);
		divFloatNewDataPort = getName(elem, "newDataPname", divFloatNewDataPort);
		divFloatClkEnPort = getName(elem, "clockEnablePname", divFloatClkEnPort);
	}

	void setCompareFloatConf(Element elem){

		floatLessThanLatency = getNumber(elem, "latency", floatLessThanLatency, 0);
		floatLessThanThroughput = getNumber(elem, "throughput", floatLessThanThroughput, 1);
		availableFloatLessThanNum = getNumber(elem, "availableNum", availableFloatLessThanNum, 1);
		cmpFloatLtModuleName = getName(elem, "moduleName", cmpFloatLtModuleName);
		cmpFloatLtClkPort = getName(elem, "clkPname", cmpFloatLtClkPort);
		cmpFloatLtLeftPort = getName(elem, "leftOperandPname", cmpFloatLtLeftPort);
		cmpFloatLtRightPort = getName(elem, "rightOperandPname", cmpFloatLtRightPort);
		cmpFloatLtResultPort = getName(elem, "resultPname", cmpFloatLtResultPort);
		cmpFloatLtLeftBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		cmpFloatLtRightBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		floatLessThanHaveNewData = getBool(elem, "haveNewDataPort", floatLessThanHaveNewData);
		cmpFloatLtNewDataPort = getName(elem, "newDataPname", cmpFloatLtNewDataPort);
		cmpFloatLtClkEnPort = getName(elem, "clockEnablePname", cmpFloatLtClkEnPort);
	}

	void setFixedToFloatConf(Element elem){

		fixedToFloatLatency = getNumber(elem, "latency", fixedToFloatLatency, 0);
		fixedToFloatThroughput = getNumber(elem, "throughput", fixedToFloatThroughput, 1);
		availableFixedToFloatNum = getNumber(elem, "availableNum", availableFixedToFloatNum, 1);
		fixedToFloatModuleName = getName(elem, "moduleName", fixedToFloatModuleName);
		fixedToFloatClkPort = getName(elem, "clkPname", fixedToFloatClkPort);
		fixedToFloatSrcPort = getName(elem, "fixedPname", fixedToFloatSrcPort);
		fixedToFloatResultPort = getName(elem, "floatPname", fixedToFloatResultPort);
		fixedToFloatSrcBitWidth = getNumber(elem, "fixedPortBitWidth", fixedToFloatSrcBitWidth, 1);
		fixedToFloatResultBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		fixedToFloatHaveNewData = getBool(elem, "haveNewDataPort", fixedToFloatHaveNewData);
		fixedToFloatNewDataPort = getName(elem, "newDataPname", fixedToFloatNewDataPort);
		fixedToFloatClkEnPort = getName(elem, "clockEnablePname", fixedToFloatClkEnPort);
	}

	void setFloatToFixedConf(Element elem){

		floatToFixedLatency = getNumber(elem, "latency", floatToFixedLatency, 0);
		floatToFixedThroughput = getNumber(elem, "throughput", floatToFixedThroughput, 1);
		availableFloatToFixedNum = getNumber(elem, "availableNum", availableFloatToFixedNum, 1);
		floatToFixedClkPort = getName(elem, "clkPname", floatToFixedClkPort);
		floatToFixedSrcPort = getName(elem, "floatPname", floatToFixedSrcPort);
		floatToFixedResultPort = getName(elem, "fixedPname", floatToFixedResultPort);
		floatToFixedSrcBitWitdh = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
		floatToFixedResultWitdh = getNumber(elem, "fixedPortBitWidth", floatToFixedResultWitdh, 1);
		floatToFixedHaveNewData = getBool(elem, "haveNewDataPort", floatToFixedHaveNewData);
		floatToFixedNewDataPort = getName(elem, "newDataPname", floatToFixedNewDataPort);
		floatToFixedClkEnPort = getName(elem, "clockEnablePname", floatToFixedClkEnPort);
	}

	void setGenCodeConf(Element elem){

		isPositiveEdge = getBool(elem, "positiveEdge", isPositiveEdge);
		isNegativeReset = getBool(elem, "negativeReset", isNegativeReset);
		paramListArrayAddrBitWidth = getNumber(elem, "paramListArrayAddrBitWidth", paramListArrayAddrBitWidth, 1);
		genCodeForCompressedState = getBool(elem, "genCodeForCompressedState", genCodeForCompressedState);
	}

	void setRegisterSharingConf(Element elem){

		maxIntSharingNum = getNumber(elem, "maxIntSharingNum", maxIntSharingNum, 1);
		maxFloatSharingNum = getNumber(elem, "maxFloatSharingNum", maxFloatSharingNum, 1);
		maxBoolSharingNum = getNumber(elem, "maxBoolSharingNum", maxBoolSharingNum, 1);
		maxLongSharingNum = getNumber(elem, "maxLongSharingNum", maxLongSharingNum, 1);
	}

	void setSchedulingConf(Element elem){
		//greedyBinary = getBool(elem, "greedyBinary", greedyBinary);
		saveReadVariableWithWARhazard = getBool(elem, "saveReadVariableWithWARhazard", saveReadVariableWithWARhazard);
		forwardingEnable = getBool(elem, "forwardingEnable", forwardingEnable);
		reduceConnectionConst = getBool(elem, "reduceConnectionConst", reduceConnectionConst);
		assignSameIPtoUnrolledNode = getBool(elem, "assignSameIPtoUnrolledNode", assignSameIPtoUnrolledNode);
	}

	void setChainingConf(Element elem){

		addIntChaining = getBool(elem, "addInt", addIntChaining);
		multIntChaining = getBool(elem, "multInt", multIntChaining);
		divIntChaining = getBool(elem, "divInt", divIntChaining);
		addFloatChaining = getBool(elem, "addFloat", addFloatChaining);
		multFloatChaining = getBool(elem, "multFloat", multFloatChaining);
		divFloatChaining = getBool(elem, "divFloat", divFloatChaining);
		fixedToFloatChaining = getBool(elem, "fixedToFloat", fixedToFloatChaining);
		floatToFixedChaining = getBool(elem, "floatToFixed", floatToFixedChaining);
		arrayReadChaining = getBool(elem, "arrayRead", arrayReadChaining);
		unaryMinusChaining = getBool(elem, "unaryMinus", unaryMinusChaining);
		BitOpChaining = getBool(elem, "bitOp", BitOpChaining);
		logicalOpChaining = getBool(elem, "logicalOp", logicalOpChaining);
		compareOpChaining = getBool(elem, "compareOp", compareOpChaining);
		shiftOpChaining = getBool(elem, "shiftOp", shiftOpChaining);
		conditionalChaining = getBool(elem, "conditional", conditionalChaining);
	}

	//システム系bit幅
	public static final int singleType = 0;
	public static final int doubleType = 1;
	public int floatingType = singleType;
	public int byteBitWidth = 8;	//0～8
	public int charBitWidth = 16;	// == short
	public int shortBitWidth = 16;	//byte～16
	public int intBitWidth = 32;	//short～32
	public int longBitWidth = 64;	//int～64
	public int floatBitWidth = 32;
	public int doubleBitWidth = 64;

	//clockEnable
	public boolean clockEnable = false;

	//最適化
	public static final String listScheduling = "list";
	public String optimizeType = listScheduling;

	//レイテンシとスループット
	public int bramLatency = 1;
	final public int bramThroughput = 1;
	public boolean useBramLibrary = true;
	public boolean isCommonClock = true;

	public int addIntLatency = 0;
	public int addIntThroughput = 1;
	public boolean addIntUseIP = false;
	public int availableAddIntNum = 1;
	public boolean addIntHaveNewData = false;

	public int multIntLatency = 7;
	public int multIntThroughput = 1;
	public boolean multIntUseIP = true;
	public int availableMultIntNum = 1;
	public boolean multIntHaveNewData = false;

	public int divIntLatency = 36;
	public int divIntThroughput = 1;
	public boolean divIntUseIP = true;
	public int availableDivIntNum = 1;
	public boolean divIntHaveNewData = true;

	public int intLessThanLatency = 1;
	public int intLessThanThroughput = 1;
	public boolean intLessThanUseIP = false;
	public int availableIntLessThanNum = 1;
	public boolean intLessThanHaveNewData = false;

	public int addFloatLatency = 12;
	public int addFloatThroughput = 1;
	public int availableAddFloatNum = 1;
	public boolean addFloatHaveNewData = false;

	public int multFloatLatency = 27;
	public int multFloatThroughput = 1;
	public int availableMultFloatNum = 1;
	public boolean multFloatHaveNewData = false;

	public int divFloatLatency = 28;
	public int divFloatThroughput = 1;
	public int availableDivFloatNum = 1;
	public boolean divFloatHaveNewData = true;

	public int floatLessThanLatency = 2;
	public int floatLessThanThroughput = 1;
	public int availableFloatLessThanNum = 1;
	public boolean floatLessThanHaveNewData = false;

	public int fixedToFloatLatency = 6;	//(integer) -> (floating)
	public int fixedToFloatThroughput = 1;
	public int availableFixedToFloatNum = 1;
	public boolean fixedToFloatHaveNewData = false;

	public int floatToFixedLatency = 6;	//(floating) -> (integer)
	public int floatToFixedThroughput = 1;
	public int availableFloatToFixedNum = 1;
	public boolean floatToFixedHaveNewData = false;

	//ポートorモジュールネーム
	//bram
	public String bramModuleName = "DualPortRAM";
	public String bramClk0Pname = "clk";
	public String bramClk1Pname = "clk1";
	public String bramAddr0Pname = "addr_0";
	public String bramAddr1Pname = "addr_1";
	public String bramDataIn0Pname = "datain_0";
	public String bramDataIn1Pname = "datain_1";
	public String bramDataOut0Pname = "dataout_0";
	public String bramDataOut1Pname = "dataout_1";
	public String bramRorW0Pname = "r_w_0";
	public String bramRorW1Pname = "r_w_1";
	public String bramClkEnable0Pname = "ce0";
	public String bramClkEnable1Pname = "ce1";

	//addFloat
	public String addFloatModuleName = "AddFloat";
	public String addFloatClkPort = "CLK";
	public String addFloatLeftPort = "A";
	public String addFloatRightPort = "B";
	public String addFloatSumPort = "RESULT";
	public String addFloatNewDataPort = "operation_nd";
	public String addFloatClkEnPort = "ce";
	public int addFloatLeftBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int addFloatRightBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int addFloatSumBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);


	//addInt
	public String addIntModuleName = "AddInt";
	public String addIntClkPort = "CLK";
	public String addIntLeftPort = "A";
	public String addIntRightPort = "B";
	public String addIntSumPort = "S";
	public String addIntAddOrSub = "ADD";
	public String addIntNewDataPort = "operation_nd";
	public String addIntClkEnPort = "ce";
	public int addIntLeftBitWidth = 32;
	public int addIntRightBitWidth = 32;
	public int addIntSumBitWidth = 32;
	public int addIntAddOrSubBitWidth = 1;

	//compareFloatLT
	public String cmpFloatLtModuleName = "CompareFloatLT";
	public String cmpFloatLtClkPort = "CLK";
	public String cmpFloatLtLeftPort = "A";
	public String cmpFloatLtRightPort = "B";
	public String cmpFloatLtResultPort = "RESULT";
	public String cmpFloatLtNewDataPort = "operation_nd";
	public String cmpFloatLtClkEnPort = "ce";
	public int cmpFloatLtLeftBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int cmpFloatLtRightBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int cmpFloatLtResultBitWidth = 1;

	//compareIntLT
	public String cmpIntLtModuleName = "CompareIntLT";
	public String cmpIntLtClkPort = "CLK";
	public String cmpIntLtLeftPort = "A";
	public String cmpIntLtRightPort = "B";
	public String cmpIntLtResultPort = "RESULT";
	public String cmpIntLtNewDataPort = "operation_nd";
	public String cmpIntLtClkEnPort = "ce";
	public int cmpIntLtLeftBitWidth = 32;
	public int cmpIntLtRightBitWidth = 32;
	public int cmpIntLtResultBitWidth = 1;

	//divFloat
	public String divFloatModuleName = "DivFloat";
	public String divFloatClkPort = "CLK";
	public String divFloatDividendPort = "A";
	public String divFloatDivisorPort = "B";
	public String divFloatQuotientPort = "RESULT";
	public String divFloatNewDataPort = "operation_nd";
	public String divFloatClkEnPort = "ce";
	public int divFloatDividendBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int divFloatDivisorBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int divFloatQuotientBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);

	//divInt
	public String divIntModuleName = "DivInt";
	public String divIntClkPort = "CLK";
	public String divIntDividendPort = "DIVIDEND";
	public String divIntDivisorPort = "DIVISOR";
	public String divIntQuotientPort = "QUOTIENT";
	public String divIntFractionalPort = "FRACTIONAL";
	public String divIntNewDataPort = "operation_nd";
	public String divIntClkEnPort = "ce";
	public int divIntDividendBitWidth = 32;
	public int divIntDivisorBitWidth = 32;
	public int divIntQuotientBitWidth = 32;
	public int divIntFractionalBitWidth = 32;

	//fixedToFloat
	public String fixedToFloatModuleName = "FixedToFloat";
	public String fixedToFloatClkPort = "CLK";
	public String fixedToFloatSrcPort = "A";
	public String fixedToFloatResultPort = "RESULT";
	public String fixedToFloatNewDataPort = "operation_nd";
	public String fixedToFloatClkEnPort = "ce";
	public int fixedToFloatSrcBitWidth = 32;
	public int fixedToFloatResultBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);

	//floatToFixed
	public String floatToFixedModuleName = "FloatToFixed";
	public String floatToFixedClkPort = "CLK";
	public String floatToFixedSrcPort = "A";
	public String floatToFixedResultPort = "RESULT";
	public String floatToFixedNewDataPort = "operation_nd";
	public String floatToFixedClkEnPort = "ce";
	public int floatToFixedSrcBitWitdh = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int floatToFixedResultWitdh = 32;

	//multFloat
	public String multFloatModuleName = "MultFloat";
	public String multFloatClkPort = "CLK";
	public String multFloatMultiplicandPort = "A";
	public String multFloatMultiplierPort = "B";
	public String multFloatProductPort = "RESULT";
	public String multFloatNewDataPort = "operation_nd";
	public String multFloatClkEnPort = "ce";
	public int multFloatMultiplicandBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int multFloatMultiplierBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);
	public int multFloatProductBitWidth = ((floatingType==doubleType) ? doubleBitWidth : floatBitWidth);

	//multInt
	public String multIntModuleName = "MultInt";
	public String multIntClkPort = "CLK";
	public String multIntMultiplicandPort = "A";
	public String multIntMultiplierPort = "B";
	public String multIntProductPort = "P";
	public String multIntNewDataPort = "operation_nd";
	public String multIntClkEnPort = "ce";
	public int multIntMultiplicandBitWidth = 32;
	public int multIntMultiplierBitWidth = 32;
	public int multIntProductBitWidth = 32;

	//generateCode
	public boolean isPositiveEdge = true;
	public boolean isNegativeReset = true;
	public int paramListArrayAddrBitWidth = 32;
	public boolean genCodeForCompressedState = true;

	//scheduling
	public boolean greedyBinary = false;	//ずっと false
	public boolean saveReadVariableWithWARhazard = false;
	public boolean forwardingEnable = true;
	//public boolean alap = false;
	public boolean reduceConnectionConst = true;
	public boolean assignSameIPtoUnrolledNode = true;

	//register sharing
	public int maxIntSharingNum = 256;
	public int maxFloatSharingNum = 256;
	public int maxLongSharingNum = 256;
	public int maxBoolSharingNum = 256;

	//チェイニング
	public boolean addIntChaining = true;	// +, -
	public boolean multIntChaining = true; // *
	public boolean divIntChaining = true;  // /, %
	public boolean addFloatChaining = true;	// +, -
	public boolean multFloatChaining = true;	// *
	public boolean divFloatChaining = true;	//  /
	public boolean fixedToFloatChaining = true;	//	(float),  (double)
	public boolean floatToFixedChaining = true;	// (byte), (short), (char), (int), (long)
	public boolean arrayReadChaining = true;
	public boolean unaryMinusChaining = true; // -
	public boolean BitOpChaining = true;	// |, &, ^, ~
	public boolean logicalOpChaining = true; // !, &&, ||
	public boolean compareOpChaining = true; // ==, !=, <, >, <=, >=
	public boolean shiftOpChaining = true;  // <<, >>, >>>
	public boolean conditionalChaining = true;// ? x:y

	//設定ファイルから指定不可のもの
	//public boolean useDontCareOptimization = false;	//一時レジスタの非生存時間は don't care にする (2013/04/15  この最適化は，かえって回路規模が大きくなる -> false )
	public boolean optimizeWire = true;
}
