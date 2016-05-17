var htmlIngredient = {
	
	idSeq:0,
	fragment:document.createDocumentFragment(),
	srcXML:null,
	javaClass:null,
	tabsID:[]
};

var unit = {
	
	xInterval:10,	//ノードとノードの間の大きさ
	leftEnd:80,		//ノードが描画される左端
	stepLineInteval:25,	//stepLine 間の幅
	stepLineWidth:3, //コントロールステップを区切る線の幅
	nodeReducRatio:0.8,	//1ライン以上のノードの縮小率
	smallNodeReducnRatio:0.6, //1ラインのノードの縮小率
	nodeWidthMagRate:1.2,	//文字列幅に対するノードの横幅の拡大率
	minNodeWidth:10,	//ノードの最小描画幅
};

var color = {

	selectedColor:[ {col:'rgb(255,90,0)',    bindedComponentID:null, liTagID:null}, //オレンジ
					{col:'rgb(255,20,147)',  bindedComponentID:null, liTagID:null}, //ピンク
					{col:'rgb(60,179,113)',  bindedComponentID:null, liTagID:null}, //みどり
					{col:'rgb(0, 255, 255)', bindedComponentID:null, liTagID:null}, //水色
					{col:'rgb(255, 255, 0)', bindedComponentID:null, liTagID:null}, //きいろ
					{col:'rgb(0,255,127)',   bindedComponentID:null, liTagID:null}, //きみどり
					{col:'rgb(138,43,226)',  bindedComponentID:null, liTagID:null}, //むらさき
					{col:'rgb(160,82,45)',   bindedComponentID:null, liTagID:null}, //茶色
					{col:'rgb(191,144,0)',   bindedComponentID:null, liTagID:null}, //黄土
					{col:'rgb(255,0,0)',     bindedComponentID:null, liTagID:null}, //あか
					{col:'rgb(60,60,255)',   bindedComponentID:null, liTagID:null}, //青
					{col:'rgb(255,220,225)', bindedComponentID:null, liTagID:null}  //うすピンク
				]
};

//DFGノードの見た目
var nodeShape = {
	
	nodeColor:'rgb(176,196,222)',	//ノードの色
	regColor:'rgb(160, 160, 160)',	//レジスタノードの色
	nodeFont:'helvetica',
	fontSize:10,	//フォントサイズ
	opacity:'0.8',
	filter:'alpha(opacity=80)',
	color:'black',
	border:'2px solid #0011EE',
	border_radius:'1.0em',
	zIndex:1
};

//メソッドの式一覧の見た目
var methodExprShape = {
		
	fontFamily:'helvetica',
	exprFontSize: 15,	//式一覧のフォントサイズ
	methodFontSize:15,	//ステージNoのフォントサイズ
	backGroundColor: 'rgb(100, 255, 100)',
	opacity:'0.80',
	filter:'alpha(opacity=80)',
	color:'black',
	border:'1px solid rgb(0, 0, 0)',
	border_radius:'0.5em',
	zIndex:5
};

//ステージの式一覧の見た目
var stageExprShape = {
	
	fontFamily:'helvetica',
	exprFontSize: 15,	//式一覧のフォントサイズ
	stageFontSize:15,	//ステージNoのフォントサイズ
	backGroundColor: 'rgb(255, 100, 100)',
	opacity:'0.80',
	filter:'alpha(opacity=80)',
	color:'black',
	border:'1px solid rgb(0, 0, 0)',
	border_radius:'0.5em',
	zIndex:2
};

//ノードの詳細情報の見た目
var nodeInfoShape = {
	
	fontFamily:'helvetica',
	fontSize: 12,
	captionFontSize: '1.1em',
	titleFontSize: '1.4em',
	nodeBackGroundColor: 'rgb(176,196,222)',
	regBackGroundColor: 'rgb(160, 160, 160)',
	opacity:'0.80',
	filter:'alpha(opacity=80)',
	color:'black',
	border:'1px solid rgb(0, 0, 0)',
	border_radius:'0.5em',
	zIndex:4
};

//ステップナンバーの見た目
var stepNumberShape = {
	
	stepNumberColor: 'rgb(255, 0, 0)',
	fontSize: 15,
	fontFamily:'helvetica',
	zIndex:3
}

//ステップを区切る線の見た目
var stepLineInfo = {
	
	strokeStyle: 'rgb(0, 0, 0)',
	strokeWidth: 3,
	x1: 0,
	y1: 0,
	x2: 0, 
	y2: 0
};

//ノードつなぐ線の見た目
var nodeLineInfo = {

	strokeStyle: 'rgb(0,255, 0)',
	strokeWidth: 2,	//ノード同士をつなぐ線の幅,
	minWidthHalf: 4,	//ノード同士をつなぐ線の最小描画スペース
	minHeightHalf: 4,	//ノード同士をつなぐ線の最小描画スペース
};

var tabShape = {
	
	fontSize:12
}


var nodeHash = {};		//key:componentID, value:[DFGraphNode object, DFGraphNode object, ...]
var nodeIdHash = {};	//key:nodeID, value:DFGraphNode object
var stepNumberLabels = []; //{div:numDiv(domElement), leftPos:top(number)}
var dfgHash = {};	//key:DFG_ID,  value:DFgraph object

var CONST_KEYWORD = {
	
	CLASS:'CLASS',
	METHOD:'METHOD',
	Phase:'Phase',
	Stage:'Stage',
	phaseID:'phaseID',
	stageID:'stageID',
	className:'className',
	methodName:'methodName',
	ArrayAccess:'ArrayAccess',
	Binary:'Binary',
	Conditional:'Conditional',
	Literal:'Literal',
	MethodInv:'MethodInv',
	Cast:'Cast',
	Unary:'Unary',
	UserDefined:'UserDefined',
	VariableAccess:'VariableAccess',	
	componentID:'componentid',
	exprInMethod:'exprInMethod',
	exprInStage:'exprInStage',

	nodeID: 'nodeID',
	startStep:'startStep',
	endStep:'endStep',
	destTypeIsReg:'destTypeIsReg',
	destSignalName:'destSignalName',
	variableName:'variableName',
	isRead:'isRead',
	dependence:'dependence',
	type:'type',
	destType:'destType',
	variableID:'variableID',
	offset:'offset',
	assignNode:'assignNode',
	op:'op',
	ipcore:'ipcore',
	leftNode:'leftNode',
	rightNode:'rightNode',
	condNode:'condNode',
	trueNode:'trueNode',
	falseNode:'falseNode',
	value:'value',
	defClass:'defClass',
	objName:'objName',
	caleeName:'caleeName',
	ipName:'ipName',
	arg:'arg',
	castType:'castType',
	srcNode:'srcNode',
	component:'component',
	kwd_this:'this',
	
	none:'none',
	notUsed:'notUsed',
	
	id:'id_',
	tab:'tab',
	dataComponentID:'data-componentID',
	dataParedNodeID:'data-paredNodeID',	//DFGraphNode の詳細タグにつける属性, 値は対応する DFGraphNode の  div タグのID
	parentCanvasID: 'parentCanvasID',
	colorSample:'colorSample',
	selectable:'selectable',
	ui_state_default:'ui-state-default',
	ui_selected:'ui-selected',
	component:'component',
	window:'window',
	Step:'Step'
};

//-------------------------JavaClass--------------------------------
function JavaClass(xml){
	this.xmlClass = $(xml).find(CONST_KEYWORD.CLASS);
	this.className = $(xml).find(CONST_KEYWORD.className).text();
	this.methodNameArray = [];
	this.methods = this._makeMethod(xml, this.methodNameArray);
	this.tabs = new Tab(this.methodNameArray, tabShape.fontSize);
}

JavaClass.prototype._makeMethod = function(xml, methodNameArray){
	
	var methodArray = [];
	var i, len;
	var methods = $(xml).find(CONST_KEYWORD.METHOD);
	
	for(i=0, len=methods.size(); i<len; ++i){
		var method = new Method(methods.eq(i));
		methodArray[i] = method;
		methodNameArray[i] = method.methodName;
	}
	return methodArray;
};

JavaClass.prototype.makeHTML = function(){
	
	var i,j, len;
	var fragment = document.createDocumentFragment();
	
	for(i=0, len=this.methods.length; i<len; ++i){
		
		var methodName = '&nbsp;&nbsp;&nbsp;&nbsp;'+this.methods[i].methodName;
		var $p = $('<p></p>');
		$p.click(toggleStageExprVisibility);
		$p.css('font-size', methodExprShape.methodFontSize+'px');
		$p.css('font-family', methodExprShape.fontFamily);
		$p.css('border', methodExprShape.border);
		//$p.css('width', canvasWidth+'px');
		$p.css('border-radius', methodExprShape.border_radius);
		$p.css('background-color', methodExprShape.backGroundColor);
		$p.css('height', heightRuler(methodName, methodExprShape.methodFontSize, methodExprShape.fontFamily)+'px');
		$p.html(methodName);
		
		var $div = $('<div></div>');
		var width = widthRuler(this.methods[i].exprInMethod, methodExprShape.exprFontSize, methodExprShape.fontFamily);
		$div.css('font-family', methodExprShape.fontFamily);
		$div.css('font-size', methodExprShape.exprFontSize);
		$div.css('background-color', methodExprShape.backGroundColor);
		$div.css('color', methodExprShape.color);
		$div.css('padding', '1em');
		$div.css('width', width+'px');
		$div.css('opacity', methodExprShape.opacity);
		$div.css('filter', methodExprShape.filter);
		$div.css('border', methodExprShape.border);
		$div.css('visibility', 'hidden');
		$div.css('z-index', methodExprShape.zIndex);
		
		$div.html(this.methods[i].exprInMethod);
		$div.draggable();
		$div.resizable(	{stop: reSizeStop});
		$p.append($div);
		this.tabs.$tabDiv_Array[i].append($p);
		this.tabs.$tabDiv_Array[i].append(this.methods[i].makeHTML());
	}
	$("#parent").append(this.tabs.makeHTML());
};

//-------------------------Method---------------------------------
function Method(method){
	this.method = method;
	this.methodName = $(method).find(CONST_KEYWORD.methodName).text();
	this.phaseID_Array = [];
	this.phaseArray = this._makePhase(method, this.phaseID_Array);
	this.exprInMethod = $(method).find(CONST_KEYWORD.exprInMethod).html();
	this.exprInMethod = removeHTMLComment(this.exprInMethod);	
	this.tabs = new Tab(this.phaseID_Array, tabShape.fontSize);
}

Method.prototype._makePhase = function(xml, phaseID_Array){
	
	var phaseArray = [];
	var i, len;
	var phases = $(xml).find(CONST_KEYWORD.Phase);
	var phaseIDs = $(xml).find(CONST_KEYWORD.phaseID);
	
	for(i=0, len=phases.size(); i<len; ++i){
		phaseArray[i] = new Phase(phases.eq(i));
		phaseID_Array[i] = CONST_KEYWORD.phaseID+phaseIDs.eq(i).text();
	}
	
	return phaseArray;
};

Method.prototype.makeHTML = function(){

	var i, len;
	for(i=0, len=this.phaseArray.length; i<len; ++i){
		this.tabs.$tabDiv_Array[i].append(this.phaseArray[i].makeHTML());
	}
	return this.tabs.makeHTML();
};

//-------------------------------phase--------------------------------
function Phase(xml){
	this.phaseID = $(xml).find(CONST_KEYWORD.phaseID).text();
	this.stageArray = this._makeStages(xml);
	this.divID = generateID();
	this.$div = $('<div></div>');//makeDiv(this.divID);
	this.$div.attr('id', this.divID);
}

Phase.prototype._makeStages = function(xml){
	
	var i, len;
	var stages = $(xml).find(CONST_KEYWORD.Stage);
	var stageArray = [];
	
	for(i=0, len=stages.size(); i<len; ++i){
		stageArray[i] = new Stage(stages.eq(i));
	}
	return stageArray;
};

Phase.prototype.makeHTML = function(){
	
	var i, len;
	for(i=0, len=this.stageArray.length; i<len; ++i){
		this.$div.append(this.stageArray[i].makeHTML());
	}
	return this.$div;
};

//-------------------------------stage--------------------------------
/**
 *<stageDiv>
 * 	<p> stageNo </p>
 *  <innerDiv>
 *    <canvas>	</canvas>
 * 	  <nodeDiv> </nodeDiv>
 * 	  <nodeDiv> </nodeDiv>
 * 			  ...
 *  </innerDiv>
 * </stageDiv>
 *  */
function Stage(xml){
	
	this.stageID = 	$(xml).find(CONST_KEYWORD.stageID).text();
	this.divID = generateID();
	this.$div = $('<div></div>');
	this.$div.css('position', 'relative');
	this.$div.attr('id', this.divID);
	this.$p = $('<p></p>');	//ステージNo を記述するタグ
	this.$innerDiv = $('<div></div>');	//「canvas」 と 「 ノードに対応したタグ」 を入れるための div タグ
	this.$innerDiv.css('position', 'relative');
	this.$exprDiv = $('<div></div>');
	
	//ステージの式を抜き出す
	this.stageExprString = $(xml).find(CONST_KEYWORD.exprInStage).html();
	this.stageExprString = removeSpace(this.stageExprString);
	this.stageExprString = removeHTMLComment(this.stageExprString);	
	this.$canvas = $('<canvas></canvas>');
	this.DFGraphArray = [];	//ステージ内のDFGの集合
	this.lineNumOfStep = [];	// lineNumOfStep[i] -> iステップ目を表示するのに必要な行数
	this.rightEnd = unit.leftEnd;	// 何かの描画が決定している最右端
	this.makeDFG(this.DFGraphArray, xml);
	this.defDrawPos();
}

Stage.prototype.makeHTML = function(){
	
	//canvas の大きさ決め
	var canvasWidth = this.rightEnd + unit.xInterval*2;
	var canvasHeight = this.calcStartLineYpos(this.lineNumOfStep.length, 0) + unit.stepLineInteval;	
	this.$canvas.attr('id', generateID());
	this.$canvas.attr('width', canvasWidth+'px').attr('height', canvasHeight+'px');
	this.$canvas.css('position', 'absolute');
	this.drawStepLine(this.$canvas, canvasWidth);
	this.drawStepNumber(this.$innerDiv);

	var i, len;
	for(i=0, len=this.DFGraphArray.length; i<len; ++i){
		this.DFGraphArray[i].makeHTML(this.$innerDiv);
	}
	
	var stageNoString = '&nbsp;&nbsp;&nbsp;&nbsp;'+CONST_KEYWORD.Stage+this.stageID;
	this.$p.click(toggleStageExprVisibility);
	this.$p.css('font-size', stageExprShape.stageFontSize+'px');
	this.$p.css('font-family', stageExprShape.fontFamily);
	this.$p.html('&nbsp;&nbsp;&nbsp;&nbsp;'+CONST_KEYWORD.Stage+this.stageID);
	this.$p.css('border', stageExprShape.border);
	this.$p.css('width', canvasWidth+'px');
	this.$p.css('border-radius', stageExprShape.border_radius);
	this.$p.css('background-color', stageExprShape.backGroundColor);
	//this.$p.addClass('ui-widget-content');
	this.$p.css('height', heightRuler(stageNoString, stageExprShape.stageFontSize, stageExprShape.fontFamily)+'px');

	this.$innerDiv.css('width', canvasWidth+'px').css('height', canvasHeight+'px');
	this.$innerDiv.append(this.$canvas);
	this.$div.append(this.$p);
	this.$div.append(this.$innerDiv);
	this.makeStageExpression();
	return this.$div;
};

//ステージ/メソッドの式一覧の 表示/非表示 切り替え
function toggleStageExprVisibility(e){

	var $exprDiv = $(this).children().eq(0);
	toggleVisibility($exprDiv, e);
	
	if($exprDiv.css('top')==='0px' && $exprDiv.css('left')==='0px')
		$exprDiv.css('left', e.offsetX+'px').css('top', e.offsetY+'px');
};

//ステージの式一覧を表示するdiv を作成
Stage.prototype.makeStageExpression = function(){

	//this.$exprDiv.css('position','fixed');
	var width = widthRuler(this.stageExprString, stageExprShape.exprFontSize, stageExprShape.fontFamily);
	//var height = heightRuler(this.stageExprString, stageExprShape.exprFontSize, stageExprShape.fontFamily);
	this.$exprDiv.css('z-index', stageExprShape.zIndex);
	this.$exprDiv.css('opacity', stageExprShape.opacity);
	this.$exprDiv.css('filter', stageExprShape.filter);
	this.$exprDiv.css('color', stageExprShape.color);
	this.$exprDiv.css('border', stageExprShape.border);
	//this.$exprDiv.css('border-radius', stageExprShape.border_radius);
	this.$exprDiv.css('font-family', stageExprShape.fontFamily);
	this.$exprDiv.css('font-size', stageExprShape.exprFontSize+'px');
	this.$exprDiv.css('background-color', stageExprShape.backGroundColor);
	this.$exprDiv.css('width', width);
	this.$exprDiv.css('padding', '1em');
	this.$exprDiv.css('visibility', 'hidden');
	//this.$exprDiv.addClass('ui-widget-content');
	this.$exprDiv.html(this.stageExprString);
	this.$exprDiv.resizable({stop: reSizeStop})
	this.$exprDiv.draggable();
	this.$p.append(this.$exprDiv);
};

function reSizeStop(){
	var fontSize = $(this).css('font-size');
	fontSize = +fontSize.substring(0, fontSize.length-2);	
	fontSize = reFontSize(fontSize, $(this).css('font-family'), $(this).html(), $(this).width(), $(this).height());
	$(this).css('font-size', fontSize+'px');
}

Stage.prototype.drawStepLine = function($canvas, canvasWidth){	//ステップを分ける線を引く

	stepLineInfo.x2 = canvasWidth;

	var i, len;
	for(i=1, len=this.lineNumOfStep.length; i<=len; ++i){
		var lineYpos = this.calcStartLineYpos(i, 0);
		stepLineInfo.y2 = stepLineInfo.y1 = lineYpos;
		$canvas.drawLine(stepLineInfo);
	}
};

Stage.prototype.drawStepNumber = function($div){
	
	var i, len;
	for(i=0, len=this.lineNumOfStep.length; i<len; ++i){
		var numDiv = makeDiv(generateID());
		var leftPosition = unit.leftEnd/3;
		numDiv.style.position = 'absolute';
		numDiv.style.fontSize = stepNumberShape.fontSize+'px';
		numDiv.style.fontFamily = stepNumberShape.fontFamily;
		numDiv.style.textAlign = 'center';
		numDiv.style.zIndex = stepNumberShape.zIndex;
		numDiv.style.color = stepNumberShape.stepNumberColor; 	
		numDiv.style.fontWeight = 'bold';
		var top = this.calcStartLineYpos(i, Math.ceil(this.getLineNumOfStep(i)/2) ) + unit.stepLineInteval/8;
		numDiv.style.top = top+'px';
		numDiv.style.left = leftPosition +'px';
		$div.append($(numDiv));
		numDiv.textContent = CONST_KEYWORD.Step+' '+i;
		stepNumberLabels[stepNumberLabels.length] = {div:numDiv, leftPos:leftPosition};
	}
};

Stage.prototype.makeDFG = function(DFGraphArray, xml){	//各ステージの DFG作成

	var children = $(xml).children();
	var i,len;
	
	for(i=0, len=children.size(); i<len; ++i){
		
		var nodesArray = [];	//DFG に属するノードの集合
		var ret = makeNode(children.eq(i), nodesArray, null);
		if(ret){
			var dfg = new DFGraph(ret, nodesArray, this);
			DFGraphArray[DFGraphArray.length] = dfg;
		}
	}
};

Stage.prototype.defDrawPos = function(){	//DFG の描画位置の決定
	
	var i,len;
	for(i=0, len=this.DFGraphArray.length; i<len; ++i)
		this.DFGraphArray[i].defDrawXPos(this);
	
	for(i=0, len=this.DFGraphArray.length; i<len; ++i)
		this.DFGraphArray[i].defDrawYpos(this);
};

Stage.prototype.setLineNumOfStep = function(step, line){
	
	if( (typeof this.lineNumOfStep[step])==='number')
		this.lineNumOfStep[step] = Math.max(line, this.lineNumOfStep[step]);
	else
		this.lineNumOfStep[step] = line;
};

Stage.prototype.getLineNumOfStep = function(step){
	
	if( (typeof this.lineNumOfStep[step])==='number')
		return this.lineNumOfStep[step];
	else
		return this.lineNumOfStep[step] = 0;
};

Stage.prototype.calcStartLineYpos = function(step, line){
	
	var i, height=0;
	for(i=0; i<step; ++i)
		height += this.getLineNumOfStep(i)+1;
	
	height += line;
	return height*unit.stepLineInteval;
};


Stage.prototype.setRightEndOfStep = function(rightEnd){
	
	this.rightEnd = Math.max(this.rightEnd, rightEnd);
};

Stage.prototype.getRightEndOfStep = function(){
	
		return this.rightEnd+unit.xInterval;
};

//-------------------------------DFGraph--------------------------------
function DFGraph(rootNode, nodes, parentStage){
	
	this.rootNode = rootNode;
	this.nodesArray = nodes;
	this.parentStage = parentStage;
	
	var DFG_ID = generateID();
	this.$divNodeWrapper =  $(makeDiv(DFG_ID));
	this.$divNodeWrapper.draggable({ axis:'x', drag : reDrawDependenceLine});
	dfgHash[DFG_ID] = this;
	
	for(var i=0, len=this.nodesArray.length; i<len; ++i)
		this.nodesArray[i].parentDFG = this;
}

// DFGraphNode のドラッグ時の 変数間依存線の書き直し
function reDrawDependenceLine(e, ui){
	
	var DFG_ID = this.getAttribute('id');
	var dfg = dfgHash[DFG_ID];
	
	var i, len;
	for(i=0, len=dfg.nodesArray.length; i<len; ++i){
		dfg.nodesArray[i].currentPosX = dfg.nodesArray[i].posX + ui.position.left;
	}
	
	for(i=0, len=dfg.nodesArray.length; i<len; ++i){
		
		if(dfg.nodesArray[i] instanceof ArrayAccess || dfg.nodesArray[i] instanceof VariableAccess){
			var j, jLen;
			var nextDependenceNodes = dfg.nodesArray[i].nextDependenceNodes;	
			for(j=0, jLen=nextDependenceNodes.length; j<jLen; ++j)
				nextDependenceNodes[j].reDrawDependenceCntr(null);
			
			if(dfg.nodesArray[i].dependenceSVG.length!==0)
				dfg.nodesArray[i].reDrawDependenceCntr(null);
		}
	}
}

DFGraph.prototype.defDrawXPos = function(parentStage){
	this.rootNode.defDrawPos(parentStage);
};

DFGraph.prototype.defDrawYpos = function(parentStage){

	var i, len;
	for(i=0, len=this.nodesArray.length; i<len; ++i){
		this.nodesArray[i].defHeight(parentStage);
		this.nodesArray[i].defDrawYpos(parentStage);
	}
};

DFGraph.prototype.makeHTML = function($parentDiv){

	var i, len;
	for(i=0, len=this.nodesArray.length; i<len; ++i)
		this.nodesArray[i].drawNode(this.$divNodeWrapper);
	
	for(i=0, len=this.nodesArray.length; i<len; ++i){
		var node = this.nodesArray[i];
		node.drawconnector(this.$divNodeWrapper);
	}
	
	for(i=0, len=this.nodesArray.length; i<len; ++i)
		this.nodesArray[i].drawNodeDetailInfo(this.$divNodeWrapper, this.nodesArray[i].divTag);
		
	$parentDiv.append(this.$divNodeWrapper);
};

//==========================================================================================
/*
 * <div(stage)>
 *	<innerDiv(stage)>
 *		<divNodeWrapper>
 *			<divTag>
 * 				<span> drawString <span>
 * 			</divTag>
 * 			<svg>
 * 				<line></line>
 * 			</svg>
 * 			<nodeDetailDiv>
 *  			...
 * 			</nodeDetailDiv>
 *		</divNodeWrapper> 
 *	</innerDiv(stage)> 
 *</div(stage)>
 **/
//--------------------DFGraphNode--------------------
function DFGraphNode(xml, nodesArray, destNode){
	
	this.nodeID = (xml===null) ? generateID() : extractInnerText(xml, CONST_KEYWORD.nodeID);	//xml === null -> このノードは DFGRaphReg 
	this.startStep = +extractInnerText(xml, CONST_KEYWORD.startStep);	//開始コントロールステップ
	this.endStep = +extractInnerText(xml, CONST_KEYWORD.endStep);
	this.destTypeIsReg = extractInnerText(xml, CONST_KEYWORD.destTypeIsReg)==='true';
	this.destSignalName = extractInnerText(xml, CONST_KEYWORD.destSignalName);
	this.destType = extractInnerText(xml, CONST_KEYWORD.destType);
	this.parentDFG;	//自分が所属するDFGraph クラス
	this.regNode = null;
	this.componentID = 	extractInnerText(xml, CONST_KEYWORD.componentID);
	this.divTag = null;
	this.nodeDetailDiv = makeDiv(generateID());	//ノードの詳細表示用のdivタグ
	this.detailInfoTitle;
	
	if(this.destTypeIsReg){
		this.regNode = new RegNode(nodesArray, destNode, this.endStep, this.destSignalName, this);
		this.destNode = this.regNode;
	}
	else{
		this.destNode = destNode; //自分の計算結果を利用するノード
	}
	
	this.strWidth;
	this.strHeight;
	this.fontSize = nodeShape.fontSize;
	this.width;
	this.height;
	this.posX;	//元の位置
	this.posY;
	this.currentPosX;	//現在の位置
	this.currentPosY;	
	this.lineInStartStep; //スタートステップの中の何行目に描画されるか
	this.lineInEndStep;
	this.srcNodeNum;	//ソースノードの数
	this.drawString;	//描画文字列
	this.selected=false;	//ノードがクリックされて選択されている -> true
	nodesArray[nodesArray.length] = this;	//自ノードをノードの集合配列に登録
	nodeIdHash[this.nodeID] = this;
}

DFGraphNode.prototype.defDrawWidth = function(){

	this.strWidth = widthRuler(this.drawString, nodeShape.fontSize, nodeShape.nodeFont);	//文字列の幅
	this.strHeight = heightRuler(this.drawString, nodeShape.fontSize, nodeShape.nodeFont);
	this.width = calcWidthFromText(this.drawString, nodeShape.fontSize, nodeShape.nodeFont);	//楕円 or 四角形の幅
	this.width = Math.max(this.width, unit.minNodeWidth);
	
	if(this.destNode){
		this.width = Math.max(this.width, this.destNode.width/this.destNode.srcNodeNum);	//このノードの描画幅は，Max(このノードの文字列幅, destNode の描画幅 / destNode のsrcNode数)
	}
};

DFGraphNode.prototype.defDrawStepAndLine = function(parentStage){	//このノードをコントロールステップの何行目に描画するか決める
	
	if(this.destNode===null){
		this.lineInStartStep = 0;
		this.lineInEndStep = 0;
	}
	else{
		
		var nextDrawableStep = this.destNode.startStep;	//このノードの直後でかつ, 何か描画するものがあるステップ
		var nextDrawableLine = this.destNode.lineInStartStep; //このノードの直後でかつ, 何か描画するものがあるライン

		if( nextDrawableStep===this.endStep ) //destNodeの startStep と このノードの endStep が一致したら , このノードは destNode の lineInStartStep+1 行目に描画する
			this.lineInEndStep = nextDrawableLine+1;
		else
			this.lineInEndStep = 0;
		
		//ノードの開始ライン決め
		if(this.startStep===this.endStep)
			this.lineInStartStep = this.lineInEndStep;
		else
			this.lineInStartStep = 0;
	}
	parentStage.setLineNumOfStep(this.startStep, this.lineInStartStep);
	parentStage.setLineNumOfStep(this.endStep, this.lineInEndStep);
};

DFGraphNode.prototype.defDrawXpos = function(parentStage, srcNodeArray){	//ノードを描画する x座標を決める

	if(srcNodeArray.length===0){
		this.posX = parentStage.getRightEndOfStep(this.startStep)+this.width/2;
		parentStage.setRightEndOfStep(this.posX + this.width/2);	//最右端の更新
		this.currentPosX = this.posX;
		return;		
	}
	
	var i, len, sum=0;
	for(i=0, len=srcNodeArray.length; i<len; ++i)
		sum += srcNodeArray[i].posX;

	this.posX = sum/len;
	this.currentPosX = this.posX;
};

DFGraphNode.prototype.defHeight = function(parentStage){ //描画するY方向の高さを決定
	
	var height=0;
	this.invertLine(parentStage);
	
	if(this.startStep!==this.endStep){
		height += parentStage.getLineNumOfStep(this.startStep) - this.lineInStartStep + 1;
		height += this.lineInEndStep + 1;
	}
	else{
		height = 1;
	}
	var i,len;
	for(i=this.startStep+1, len=this.endStep-1; i<=len; ++i)
		height += parentStage.getLineNumOfStep(i)+1; 
	
	this.height = height*unit.stepLineInteval;
};

/**
 *-----------		-----------<br>
 *   line2			   line0<br>
 * ----------		----------<br>
 *   line1      ->     line1<br>
 * ----------		----------<br>
 *   line0			   line2<br>
 * ----------		----------<br>
 *  */
DFGraphNode.prototype.invertLine = function(parentStage){	//ラインナンバーをひっくり返す
	
	this.lineInStartStep = parentStage.getLineNumOfStep(this.startStep) - this.lineInStartStep;
	this.lineInEndStep = parentStage.getLineNumOfStep(this.endStep) - this.lineInEndStep;
};

DFGraphNode.prototype.defDrawYpos = function(parentStage){//描画するY座標を決定
	
	var startYpos = parentStage.calcStartLineYpos(this.startStep, this.lineInStartStep);
	this.posY = startYpos+this.height/2;
	this.currentPosY = this.posY;
};

DFGraphNode.prototype.drawNode = function($parentDiv){	//DFG描画
	
	this.drawText($parentDiv);
};

DFGraphNode.prototype.drawText = function($parentDiv){	//ノードの文字列描画
	
	var div = makeDiv(this.nodeID);//ID = nodeID
	var outerDiv = makeDiv(this.nodeID);//ID = nodeID
	
	var drawHeight = (this.endStep === this.startStep) ? this.height*unit.smallNodeReducnRatio : 
														 this.height-unit.stepLineInteval*unit.nodeReducRatio;//実際に描画する際の高さ

	div.style.position = 'absolute';
	div.style.left = (this.posX-this.width/2)+'px';
	div.style.top = (this.posY-drawHeight/2)+'px';
	div.style.width = this.width+'px';
	div.style.height = drawHeight+'px';
	div.style.opacity = nodeShape.opacity;
	div.style.filter = nodeShape.filter;
	div.style.color = nodeShape.color;
	div.style.border = nodeShape.border;
	div.style.borderRadius = nodeShape.border_radius;
	div.style.zIndex = nodeShape.zIndex;

	if(this instanceof RegNode)
		div.style.backgroundColor = nodeShape.regColor;
	else
		div.style.backgroundColor = nodeShape.nodeColor;

	div.setAttribute(CONST_KEYWORD.dataComponentID, this.componentID);	//データコンポーネントIDの登録
	div.addEventListener('dblclick', selectNode);
	div.addEventListener('contextmenu', toggleNodeInfoVisibility);
	this.divTag = div;
	addNodeHash(this.componentID, this);
	
	var span = makeSpan(generateID());	//削除禁止
	span.innerHTML = this.drawString;
	span.style.position = 'absolute';
	span.style.left = (this.width-this.strWidth)/2+'px';
	span.style.top = (drawHeight-this.strHeight)/2+'px';
	span.style.fontSize = this.fontSize+'px';
	span.style.fontFamily = nodeShape.nodeFont;
	span.style.width = this.strWidth+'px';
	span.style.height = this.strHeight+'px';
	span.style.textAlign = 'center';
	span.style.zIndex = nodeShape.zIndex;
	div.appendChild(span);
	$parentDiv.append(div);
};

/** 
 *各ノードの詳細を表示するタグを作る
 *@param paredDiv この詳細に対応する Div タグ
 */
DFGraphNode.prototype.drawNodeDetailInfo = function($parentDiv, paredDiv){

	var title = document.createElement('span');
	title.style.fontSize = nodeInfoShape.titleFontSize;
	title.style.fontStyle = 'italic';
	title.innerHTML = this.detailInfoTitle+'&nbsp;&nbsp;&nbsp;&nbsp;<br>';
	this.nodeDetailDiv.insertBefore(title, this.nodeDetailDiv.firstChild);

	var width = widthRuler(this.nodeDetailDiv.innerHTML, nodeInfoShape.fontSize, nodeInfoShape.fontFamily);
	this.nodeDetailDiv.style.opacity = nodeInfoShape.opacity;
	this.nodeDetailDiv.style.filter = nodeInfoShape.filter;
	this.nodeDetailDiv.style.color = nodeInfoShape.color;
	this.nodeDetailDiv.style.border = nodeInfoShape.border;
	this.nodeDetailDiv.style.fontFamily = nodeInfoShape.fontFamily;
	this.nodeDetailDiv.style.fontSize = nodeInfoShape.fontSize+'px';
	this.nodeDetailDiv.style.backgroundColor = (this instanceof RegNode) ? nodeInfoShape.regBackGroundColor : nodeInfoShape.nodeBackGroundColor;
	this.nodeDetailDiv.style.width = width+'px';
	this.nodeDetailDiv.style.position = 'absolute';
	this.nodeDetailDiv.style.zIndex = nodeInfoShape.zIndex;
	this.nodeDetailDiv.style.visibility = 'hidden';
	this.nodeDetailDiv.style.paddingLeft = '1em';
	this.nodeDetailDiv.style.paddingBottom = '1em';
	this.nodeDetailDiv.addEventListener('contextmenu', toggleNodeInfoVisibility);
	this.nodeDetailDiv.addEventListener('dblclick', selectNode);
	
	$nodeDetailDiv = $(this.nodeDetailDiv);
	$nodeDetailDiv.attr(CONST_KEYWORD.dataParedNodeID, this.nodeID);	//ノードIDを 対応するノード詳細タグの属性 dataParedNodeID に登録する
	$nodeDetailDiv.resizable({stop: reSizeStop})
	$nodeDetailDiv.draggable();
	//this.divTag.appendChild(this.nodeDetailDiv);
	$parentDiv.append($nodeDetailDiv);
}

//ノードの詳細の 表示/非表示 切り替え
function toggleNodeInfoVisibility(e){

	e.preventDefault();
	var id;
	var $nodeInfoDiv;

	if(this.getAttribute(CONST_KEYWORD.dataComponentID) != null){	//コンポーネントIDがある　-> ノードタグがクリックされた
		var nodeID = this.getAttribute('id');	
		var dfgNode = nodeIdHash[nodeID];
		$nodeInfoDiv = $(dfgNode.nodeDetailDiv);
		toggleVisibility($nodeInfoDiv, e);
	}
	else if(this.getAttribute(CONST_KEYWORD.dataParedNodeID) != null){	//詳細タグがクリックされた
		$nodeInfoDiv = $(this);
		toggleVisibility($nodeInfoDiv, e);
	}
		
	if($nodeInfoDiv.css('top')==='0px' && $nodeInfoDiv.css('left')==='0px'){
		var thisLeft = this.style.left;
		thisLeft = +thisLeft.substring(0, thisLeft.length-2);
		var thisTop = this.style.top;
		thisTop = +thisTop.substring(0, thisTop.length-2);
		$nodeInfoDiv.css('left', thisLeft+e.layerX+'px').css('top', thisTop+e.layerY+'px');
	}
};

DFGraphNode.prototype.drawconnector = function($divNodeWrapper){

	if( this.destNode===null )
		return;

	var drawHeight = (this.endStep === this.startStep) ? this.height*unit.smallNodeReducnRatio : 
														 this.height-unit.stepLineInteval*unit.nodeReducRatio;//実際に描画する際の高さ

	var drawHeightDest = (this.destNode.endStep === this.destNode.startStep) ? this.destNode.height*unit.smallNodeReducnRatio : 
														     				   this.destNode.height-unit.stepLineInteval*unit.nodeReducRatio;//実際に描画する際の高さ
	
	var minWidth = nodeLineInfo.minWidthHalf*2;
	var minWidthHalf = nodeLineInfo.minWidthHalf;
	var left = Math.min(this.currentPosX, this.destNode.currentPosX) - minWidthHalf;
	var top  = this.currentPosY+drawHeight/2;
	var width = Math.abs(this.currentPosX - this.destNode.currentPosX) + minWidth;
	var height = Math.abs( (this.currentPosY+drawHeight/2) - (this.destNode.currentPosY-drawHeightDest/2) );
		
	var linePos = this.defLinePos(this, this.destNode, width, height, minWidthHalf, 0);
	var startX = linePos.stX;
	var endX = linePos.enX;
	var offsetX = 2, offsetY = 1; //svg の線のずれを補正
	var svg = createLine(nodeLineInfo.strokeStyle, nodeLineInfo.strokeWidth, 
			   			 startX+offsetX, 0+offsetY, endX+offsetX, height+offsetY, width, height, left, top);
	$divNodeWrapper.append($(svg));
};

//SVG 内での line の描画位置を決める
DFGraphNode.prototype.defLinePos = function(startNode, endNode, width, height, minWidthHalf, minHeightHalf){
	
	var startX, endX;
	if(startNode.currentPosX < endNode.currentPosX){
		startX = 0+minWidthHalf;
		endX = width-minWidthHalf;
	}
	else if(startNode.currentPosX > endNode.currentPosX){
		startX = width-minWidthHalf;
		endX = 0+minWidthHalf;
	}
	else{
		startX = minWidthHalf;
		endX = minWidthHalf;
	}
	
	var startY, endY;
	if(startNode.currentPosY < endNode.currentPosY){
		startY = 0+minHeightHalf;
		endY = height-minHeightHalf;
	}
	else if(startNode.currentPosY > endNode.currentPosY){
		startY = height-minHeightHalf;
		endY = 0+minHeightHalf;
	}
	else{
		startY = minHeightHalf;
		endY = minHeightHalf;
	}
	return {stX:startX, enX:endX, stY:startY, enY:endY};
}

DFGraphNode.prototype.createDependenceCntr = function($parentDiv, strokeColor){

	if(this.prevDependenceNodeIDs.length===0)	//依存関係のあるノードがない
		return;
	
	var i, len;
	for(i=0, len=this.prevDependenceNodeIDs.length; i<len; ++i){
			
		var previousNode = nodeIdHash[this.prevDependenceNodeIDs[i]];
		previousNode.nextDependenceNodes[previousNode.nextDependenceNodes.length] = this;
		
		var minWidth = nodeLineInfo.minWidthHalf*2;
		var minHeight = nodeLineInfo.minHeightHalf*2;
		var minWidthHalf = nodeLineInfo.minWidthHalf;
		var minHeightHalf = nodeLineInfo.minHeightHalf;
		var left = Math.min(this.currentPosX, previousNode.currentPosX) - minWidthHalf;
		var top  = Math.min(this.currentPosY, previousNode.currentPosY) - minHeightHalf;
		var width = Math.abs(this.currentPosX - previousNode.currentPosX) + minWidth;
		var height = Math.abs(this.currentPosY - previousNode.currentPosY) + minHeight;
		
		var linePos = this.defLinePos(this, previousNode, width, height, minWidthHalf, minHeightHalf);
		var startX = linePos.stX, startY = linePos.stY;
		var endX   = linePos.enX, endY   = linePos.enY;
		var svg = createLine(strokeColor, nodeLineInfo.strokeWidth, 
			   			 	 startX, startY, endX, endY, width, height, left, top);
		$parentDiv.append($(svg));
		this.dependenceSVG[i] = svg;
	}
};

function createLine(strokeStyle, strokeWidth, startX, startY, endX, endY, width, height, left, top){
	
	var line = 	document.createElementNS("http://www.w3.org/2000/svg","line");
    line.setAttribute("x1", startX);
    line.setAttribute("y1", startY);
   	line.setAttribute("x2", endX);
    line.setAttribute("y2", endY);
    line.style.stroke = strokeStyle;
    line.style.strokeWidth = strokeWidth;
    
	var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
	svg.style.width = width+'px';
	svg.style.height = height+'px';
	svg.style.position = 'absolute';
	svg.style.left = left+'px';
	svg.style.top = top+'px';
	svg.appendChild(line);
	return svg;
}

DFGraphNode.prototype.reDrawDependenceCntr = function(strokeColor){
	
	var i, len;
	for(i=0, len=this.prevDependenceNodeIDs.length; i<len; ++i){
		
		var previousNode = nodeIdHash[this.prevDependenceNodeIDs[i]];
		
		var minWidth = nodeLineInfo.minWidthHalf*2;
		var minHeight = nodeLineInfo.minHeightHalf*2;
		var minWidthHalf = nodeLineInfo.minWidthHalf;
		var minHeightHalf = nodeLineInfo.minHeightHalf;
		var left = Math.min(this.currentPosX, previousNode.currentPosX) - minWidthHalf;
		var top  = Math.min(this.currentPosY, previousNode.currentPosY) - minHeightHalf;
		var width = Math.abs(this.currentPosX - previousNode.currentPosX) + minWidth;
		var height = Math.abs(this.currentPosY - previousNode.currentPosY) + minHeight;
		
		var linePos = this.defLinePos(this, previousNode, width, height, minWidthHalf, minHeightHalf);
		var startX = linePos.stX, startY = linePos.stY;
		var endX   = linePos.enX, endY   = linePos.enY;
		
		redrawLine(this.dependenceSVG[i], this.dependenceSVG[i].firstChild, strokeColor, startX, startY, endX, endY, width, height, left, top);
	}
}

function redrawLine(svg, line, strokeColor, startX, startY, endX, endY, width, height, left, top){

    line.setAttribute("x1", startX);
    line.setAttribute("y1", startY);
   	line.setAttribute("x2", endX);
    line.setAttribute("y2", endY);
    if(strokeColor!==null)
    	line.style.stroke = strokeColor;
    
	svg.style.width = width+'px';
	svg.style.height = height+'px';
	svg.style.left = left+'px';
	svg.style.top = top+'px';
}

DFGraphNode.prototype.dumpParam = function(){
	
	console.debug(this);
	console.debug(this.drawString);
	console.debug(this.width+' width');
	console.debug(this.height+' height');
	console.debug(this.lineInStartStep+' startLine');	
	console.debug(this.lineInEndStep+' endLine');
	console.debug(this.startStep+' start');
	console.debug(this.endStep+' end');
	console.debug(this.posX+' posX');
	console.debug(this.posY+' posY');
};

//ノードの詳細表示（コンポーネント）部分作成
DFGraphNode.prototype.extractCompoInfo = function(xml){
	
	var componentInfo = extractInnerHTML(xml, CONST_KEYWORD.component);
	componentInfo = removeHTMLComment(componentInfo);
	
	var cmpoSpan = document.createElement('span');
	var caption = document.createElement('span');
	caption.style.fontSize = nodeInfoShape.captionFontSize;
	caption.style.fontWeight = 'bold';
	caption.innerHTML = '&nbsp;&nbsp;&nbsp;&nbsp;&lt;&nbsp;component&nbsp;&gt;<br>';

	cmpoSpan.appendChild(caption);
	cmpoSpan.innerHTML += componentInfo;
	cmpoSpan.style.fontSize = '1em';
	this.nodeDetailDiv.appendChild(cmpoSpan);
}

//---------------------ArrayAccess----------------------
function ArrayAccess(xml, nodesArray, destNode){
		
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	
	this.variableName = extractInnerText(xml, CONST_KEYWORD.variableName);
	this.isRead = extractInnerText(xml, CONST_KEYWORD.isRead)==='true';
	this.type = extractInnerText(xml, CONST_KEYWORD.type);
	this.variableID = +extractInnerText(xml, CONST_KEYWORD.variableID );
	this.prevDependenceNodeIDs = extractInnerText(xml, CONST_KEYWORD.dependence);	//変数アクセスに関して依存関係のあるノードのID(このノードの前にアクセス)
	this.prevDependenceNodeIDs = (this.prevDependenceNodeIDs==='') ? [] : this.prevDependenceNodeIDs.split(',');
	this.dependenceSVG = [];
	this.nextDependenceNodes = [];	//変数アクセスに関して依存関係のあるノード(このノードの後にアクセス)
	this.drawString = this.variableName+'&nbsp;[&nbsp;]';
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.type+'&nbsp;)';
	
	this.offset = makeNode( $(xml).children(CONST_KEYWORD.offset).children().eq(0), nodesArray, this);
	this.assignNode;	
	if(!this.isRead){
		this.assignNode = makeNode($(xml).children(CONST_KEYWORD.assignNode).children().eq(0), nodesArray, this);
		this.srcNodeNum = 2;
	}
	else{
		this.assignNode = null;
		this.srcNodeNum = 1;
	}
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
ArrayAccess.prototype = Object.create(DFGraphNode.prototype);
ArrayAccess.prototype.constructor = ArrayAccess;

ArrayAccess.prototype.defDrawPos = function(parentStage){

	if(this.isRead)
		--this.endStep;	//読み取りの場合, 次のノードとの重なりを避けるため, endStep を1小さくする
		
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	// 描画ラインを決定
	
	this.offset.defDrawPos(parentStage);
	
	var srcNodeArray;
	if(!this.isRead){
		this.assignNode.defDrawPos(parentStage);
		srcNodeArray = [this.offset, this.assignNode];
	}
	else{
		srcNodeArray = [this.offset];
	}
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};

//-------------------------Binary------------------------
function Binary(xml, nodesArray, destNode){

	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	
	this.op = extractInnerText(xml, CONST_KEYWORD.op);
	this.drawString = this.op;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	this.ipcore = extractInnerText(xml, CONST_KEYWORD.ipcore);
	this.leftNode = makeNode($(xml).children(CONST_KEYWORD.leftNode).children().eq(0), nodesArray, this);
	this.rightNode = makeNode($(xml).children(CONST_KEYWORD.rightNode).children().eq(0), nodesArray, this);
	this.srcNodeNum = 2;
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
Binary.prototype = Object.create(DFGraphNode.prototype);
Binary.prototype.constructor = Binary;

Binary.prototype.defDrawPos = function(parentStage){

	if(this.ipcore!==CONST_KEYWORD.notUsed)//IPコアを利用している場合, 次のノードとの重なりを避けるため　endStep を1小さくする
		--this.endStep;
		
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
		
	this.leftNode.defDrawPos(parentStage);
	this.rightNode.defDrawPos(parentStage);
	
	var srcNodeArray = [this.leftNode, this.rightNode];
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};

//-------------------------Conditional------------------------
function Conditional(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.drawString = '?&nbsp;&nbsp;:';
	this.detailInfoTitle = 'conditional'+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	this.condNode = makeNode($(xml).children(CONST_KEYWORD.condNode).children().eq(0), nodesArray, this);
	this.trueNode = makeNode($(xml).children(CONST_KEYWORD.trueNode).children().eq(0), nodesArray, this);
	this.falseNode = makeNode($(xml).children(CONST_KEYWORD.falseNode).children().eq(0), nodesArray, this);
	this.srcNodeNum = 3;
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
Conditional.prototype = Object.create(DFGraphNode.prototype);
Conditional.prototype.constructor = Conditional;

Conditional.prototype.defDrawPos = function(parentStage){

	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	
	this.condNode.defDrawPos(parentStage);
	this.trueNode.defDrawPos(parentStage);
	this.falseNode.defDrawPos(parentStage);
	
	var srcNodeArray = [this.condNode, this.trueNode, this.falseNode];
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};
//-------------------------Literal------------------------
function Literal(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.value = extractInnerText(xml, CONST_KEYWORD.value);
	this.drawString = this.value;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	this.srcNodeNum = 0;
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
Literal.prototype = Object.create(DFGraphNode.prototype);
Literal.prototype.constructor = Literal;

Literal.prototype.defDrawPos = function(parentStage){

	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	var nullAry = [];
	this.defDrawXpos(parentStage, nullAry);	//描画x座標を決定
};

//-------------------------MethodInv------------------------
function MethodInv(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.defClass = extractInnerText(xml, CONST_KEYWORD.defClass);
	this.objName = extractInnerText(xml, CONST_KEYWORD.objName);
	this.caleeName = extractInnerText(xml, CONST_KEYWORD.caleeName);
	this.argArray = [];
	this.drawString = (CONST_KEYWORD.kwd_this===this.objName) ? this.caleeName : this.objName+'.'+this.caleeName;
	this.drawString += '&nbsp;(...)';
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	
	var i, len, $args = $(xml).children(CONST_KEYWORD.arg);
	for(i=0, len=$args.size(); i<len; ++i){
		this.argArray[i] = makeNode($args.eq(i).children().eq(0), nodesArray, this);
	}
	this.srcNodeNum = $args.size();
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
MethodInv.prototype = Object.create(DFGraphNode.prototype);
MethodInv.prototype.constructor = MethodInv;

MethodInv.prototype.defDrawPos = function(parentStage){
	
	--this.endStep;	//次のノードとの重なりを避けるため　endStep を1小さくする
	
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	
	var i, len;
	for(i=0, len=this.argArray.length; i<len; ++i)
		this.argArray[i].defDrawPos(parentStage);
		
	this.defDrawXpos(parentStage, this.argArray);	//描画x座標を決定
};

//-------------------------TypeCast------------------------
function TypeCast(xml, nodesArray, destNode){

	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.castType = extractInnerText(xml, CONST_KEYWORD.castType);
	this.ipcore = extractInnerText(xml, CONST_KEYWORD.ipcore);
	this.srcNode = makeNode($(xml).children(CONST_KEYWORD.srcNode).children().eq(0), nodesArray, this);
	this.drawString = '('+this.castType+')';
	this.detailInfoTitle = 'cast&nbsp;&nbsp;('+this.srcNode.destType+'&nbsp;&rarr;&nbsp;'+this.castType+')';
	this.srcNodeNum = 1;
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
TypeCast.prototype = Object.create(DFGraphNode.prototype);
TypeCast.prototype.constructor = TypeCast;

TypeCast.prototype.defDrawPos = function(parentStage){
	
	if(this.ipcore!==CONST_KEYWORD.notUsed)//IPコアを利用している場合, 次のノードとの重なりを避けるため　endStep を1小さくする
		--this.endStep;
		
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	
	this.srcNode.defDrawPos(parentStage);
	
	var srcNodeArray = [this.srcNode];
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};


//-------------------------Unary------------------------
function Unary(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.op = extractInnerText(xml, CONST_KEYWORD.op);
	this.drawString = this.op;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	this.srcNode = makeNode($(xml).children(CONST_KEYWORD.srcNode).children().eq(0), nodesArray, this);
	this.srcNodeNum = 1;
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
Unary.prototype = Object.create(DFGraphNode.prototype);
Unary.prototype.constructor = Unary;

Unary.prototype.defDrawPos = function(parentStage){

	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	
	this.srcNode.defDrawPos(parentStage);
	
	var srcNodeArray = [this.srcNode];
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};

//-------------------------UserDefined------------------------
function UserDefined(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.ipName = extractInnerText(xml, CONST_KEYWORD.ipName);
	this.argArray = [];
	this.drawString = this.ipName;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';

	var i, len, $args = $(xml).children(CONST_KEYWORD.arg);
	for(i=0, len=$args.size(); i<len; ++i){
		this.argArray[i] = makeNode($args.eq(i).children().eq(0), nodesArray, this);
	}
	this.srcNodeNum = $args.size();	
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
UserDefined.prototype = Object.create(DFGraphNode.prototype);
UserDefined.prototype.constructor = UserDefined;

UserDefined.prototype.defDrawPos = function(parentStage){
	
	--this.endStep;	//次のノードとの重なりを避けるため　endStep を1小さくする
	
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定
	
	var i, len;
	for(i=0, len=this.argArray.length; i<len; ++i)
		this.argArray[i].defDrawPos(parentStage);
		
	this.defDrawXpos(parentStage, this.argArray);	//描画x座標を決定
};

//-------------------------VariableAccess------------------------
function VariableAccess(xml, nodesArray, destNode){
	
	DFGraphNode.apply(this, [xml, nodesArray, destNode]);
	this.variableName = extractInnerText(xml, CONST_KEYWORD.variableName);
	this.isRead = extractInnerText(xml, CONST_KEYWORD.isRead)==='true';
	this.type = extractInnerText(xml, CONST_KEYWORD.type);
	this.variableID = +extractInnerText(xml, CONST_KEYWORD.castType);
	this.drawString = this.variableName;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.type+'&nbsp;)';
	this.assignNode;
	this.prevDependenceNodeIDs = extractInnerText(xml, CONST_KEYWORD.dependence);	//変数アクセスに関して依存関係のあるノードのID(このノードの前にアクセス)
	this.prevDependenceNodeIDs = (this.prevDependenceNodeIDs==='') ? [] : this.prevDependenceNodeIDs.split(',');
	this.dependenceSVG = [];
	this.nextDependenceNodes = [];	//変数アクセスに関して依存関係のあるノード(このノードの後にアクセス)
	
	if(!this.isRead){
		this.assignNode = makeNode($(xml).children(CONST_KEYWORD.assignNode).children().eq(0), nodesArray, this);
		this.srcNodeNum = 1;
	}
	else{
		this.assignNode = null;
		this.srcNodeNum = 0;
	}
	this.extractCompoInfo(xml);
	return this.regNode ? this.regNode : this;
}
VariableAccess.prototype = Object.create(DFGraphNode.prototype);
VariableAccess.prototype.constructor = VariableAccess;

VariableAccess.prototype.defDrawPos = function(parentStage){

	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	//描画ラインを決定

	var srcNodeArray;
	if(!this.isRead){
		this.assignNode.defDrawPos(parentStage);
		srcNodeArray = [this.assignNode];
	}
	else{
		srcNodeArray = [];
	}	
	this.defDrawXpos(parentStage, srcNodeArray);	//描画x座標を決定
};

//--------------------------------RegNode----------------------------
function RegNode(nodesArray, destNode, step, destSignalName, srcNode){

	DFGraphNode.apply(this, [null, nodesArray, destNode]);
	
	this.startStep = step;
	this.endStep = step;
	this.regName = destSignalName;
	this.drawString = 'reg';
	this.srcNode = srcNode;
	this.srcNodeNum = 1;
	this.componentID = this.regName;
	this.destType = srcNode.destType;
	this.detailInfoTitle = this.drawString+'&nbsp;(&nbsp;'+this.destType+'&nbsp;)';
	this.extractCompoInfo(this.regName);
}
RegNode.prototype = Object.create(DFGraphNode.prototype);
RegNode.prototype.constructor = RegNode;

RegNode.prototype.defDrawPos = function(parentStage){
		
	this.defDrawWidth();	//描画幅決定
	this.defDrawStepAndLine(parentStage);	// 描画ラインを決定
	this.srcNode.defDrawPos(parentStage);
	this.defDrawXpos(parentStage, [this.srcNode]);	//描画x座標を決定
};

//ノードの詳細表示（コンポーネント）部分作成
RegNode.prototype.extractCompoInfo = function(regName){
	
	var cmpoSpan = document.createElement('span');
	var caption = document.createElement('span');
	caption.style.fontSize = nodeInfoShape.captionFontSize;
	caption.style.fontWeight = 'bold';
	caption.innerHTML = '&nbsp;&nbsp;&nbsp;&nbsp;&lt;&nbsp;component&nbsp;&gt;<br>';

	cmpoSpan.appendChild(caption);
	cmpoSpan.innerHTML += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg&nbsp;:&nbsp;'+regName+'&nbsp;&nbsp;&nbsp;&nbsp';
	cmpoSpan.style.fontSize = '1em';
	this.nodeDetailDiv.appendChild(cmpoSpan);
}

//--------------------------------Tab---------------------------------

function Tab(tabNames, tabFontSize){

	this.topDivID = generateID();
	this.$topDiv = this._makeTopDiv(this.topDivID);	//タブ全体を構築する<div>
	//this.$topDiv.css('overflow-y', 'scroll');
	this.ulID = generateID();
	this.$ul = this._makeUl(this.ulID, tabFontSize);	//タブの名前を囲む<ul>
	this.aTagHref_Array = [];
	this.$li_Array = this._makeLi(this.ulID, tabNames, this.aTagHref_Array);	//タブの名前
	this.tabDivID_Array = [];
	this.$tabDiv_Array = this._makeTabDivs(this.aTagHref_Array, this.tabDivID_Array);
}

Tab.prototype._makeTopDiv = function(id){
	var $div = $('<div> </div>');
	$div.attr("id", id);
	htmlIngredient.tabsID[htmlIngredient.tabsID.length] = id;
	return $div;
};

Tab.prototype._makeUl = function(id, tabFontSize){
	var $ul =  $('<ul> </ul>');
	$ul.attr("id", id);
	$ul.css('font-size', tabFontSize+'px');
	return $ul;
};

Tab.prototype._makeLi = function(ulID, tabNames, aTagHref_Array){
	
	var liArray = [];
	var i,len;
	
	for(i=0, len=tabNames.length; i<len; ++i){
		var li = $('<li> </li>');
		var aTag = $('<a> </a>');
		var aTagHref = '#'+CONST_KEYWORD.tab+'_'+ulID+'_'+i;
	
		aTag.attr('href', aTagHref);
		aTag.text(tabNames[i]);
		li.append(aTag);
		liArray[i] = li;
		aTagHref_Array[i] = aTagHref;
	}
	return liArray;
};

Tab.prototype._makeTabDivs = function(aTagHref_Array, tabDivID_Array){
	
	var i, len;
	var divArray = [];
	
	for(i=0, len=aTagHref_Array.length; i<len; ++i){
		var div =  $('<div> </div>');
		tabDivID = aTagHref_Array[i].replace('#','');
		div.attr("id", tabDivID );
		divArray[i] = div;
		tabDivID_Array[i] = tabDivID;
	}
	return divArray;
};

Tab.prototype.makeHTML = function(){
	
	var i, len;
	for(i=0, len=this.$li_Array.length; i<len; ++i)
		this.$ul.append(this.$li_Array[i]);
	
	this.$topDiv.append(this.$ul);
	
	for(i=0, len=this.$tabDiv_Array.length; i<len; ++i){
		this.$topDiv.append(this.$tabDiv_Array[i]);
	}
	
	return this.$topDiv;
};
//--------------------------------------------------------------------

window.onload = start;

//xml ロード
function start(){
	dropPrepare();
}

function dropPrepare(){
	

	var stop = function(e) {
		e.preventDefault();
		e.stopPropagation();
	};

	var init = function(){
		
		nodeHash = {};
		nodeIdHash = {};
		stepNumberLabels = [];
		dfgHash = {};
		var parent = document.getElementById('parent');
		var i, len;
		for (i=0, len=parent.childNodes.length; i<len; ++i)
			parent.removeChild(parent.childNodes[i]);
			
		var colorSelecter = document.getElementById('colorSelecter');
		for (i=0, len=colorSelecter.childNodes.length; i<len; ++i)
			colorSelecter.removeChild(colorSelecter.childNodes[i]);
			
		htmlIngredient.idSeq = 0;
		htmlIngredient.srcXML = null;
		htmlIngredient.javaClass = null;
		htmlIngredient.tabsID = [];
		
		for(i=0, len=color.selectedColor.length; i<len; ++i){
			color.selectedColor[i].bindedComponentID = null;
			color.selectedColor[i].litagID = null;
		}/*
var color = {

	selectedColor:[ {col:'rgb(255,90,0)',    bindedComponentID:null, liTagID:null}, //オレンジ
					{col:'rgb(255,20,147)',  bindedComponentID:null, liTagID:null}, //ピンク
					{col:'rgb(60,179,113)',  bindedComponentID:null, liTagID:null}, //みどり
					{col:'rgb(0, 255, 255)', bindedComponentID:null, liTagID:null}, //水色
					{col:'rgb(255, 255, 0)', bindedComponentID:null, liTagID:null}, //きいろ
					{col:'rgb(0,255,127)',   bindedComponentID:null, liTagID:null}, //きみどり
					{col:'rgb(138,43,226)',  bindedComponentID:null, liTagID:null}, //むらさき
					{col:'rgb(160,82,45)',   bindedComponentID:null, liTagID:null}, //茶色
					{col:'rgb(191,144,0)',   bindedComponentID:null, liTagID:null}, //黄土
					{col:'rgb(255,0,0)',     bindedComponentID:null, liTagID:null}, //あか
					{col:'rgb(60,60,255)',   bindedComponentID:null, liTagID:null}, //青
					{col:'rgb(255,220,225)', bindedComponentID:null, liTagID:null}  //うすピンク
				]*/
	};
	
	$(function() {
		var $dropDiv = $("#drop");

		if (!window.FileReader) {
			$dropDiv.html('File API is out of use');
			return false;
		}

		var eveCancel = function(e) {
			e.preventDefault();
			e.stopPropagation();
			return false;
		};

		var findDroppedFileName = function(e) {

			eveCancel(e);
			init();
			var file = e.originalEvent.dataTransfer.files[0];	//1つめのファイルのみ対象とする
			if(file.name.substring(file.name.length-4, file.name.length)!=='.xml'){
				alert('drag & drop xml file');
				return false;
			}
			
			var objectURL = window.URL.createObjectURL(file);
			$.ajax({
				url : objectURL,
				type : 'GET',
				dataType : 'xml',
				timeout : 1000,
				//error:fnc_xmlerr, //ロード失敗
				success : xmlLoad //ロード成功
			});
			return false;
		};
		$dropDiv.bind('drop', findDroppedFileName);
		$dropDiv.bind('dragenter', eveCancel);
		$dropDiv.bind('dragover', eveCancel);
	}); 

}

function xmlLoad(xml){
	htmlIngredient.srcXML = xml;
	main();
}

function main(){
	
	prepareDescriptiveText();
	htmlIngredient.javaClass = new JavaClass(htmlIngredient.srcXML);
	htmlIngredient.javaClass.makeHTML();
	constructTabs();
	makeColorSelecter();
}

function prepareDescriptiveText(){
	$('#descriptive li .DFGNode').css('background-color', nodeShape.nodeColor)
								 .css('opacity', nodeShape.opacity)
								 .css('filter', nodeShape.filter)
								 .css('border', nodeShape.border)
								 .css('border-radius', nodeShape.border_radius);

	$('#descriptive li .methodName').css('background-color', methodExprShape.backGroundColor)
									.css('opacity', methodExprShape.opacity)
								 	.css('filter', methodExprShape.filter)
								 	.css('border', methodExprShape.border)
								 	.css('border-radius', methodExprShape.border_radius);
								 	
	$('#descriptive li .stageNum').css('background-color', stageExprShape.backGroundColor)
								  .css('opacity', stageExprShape.opacity)
								  .css('filter', stageExprShape.filter)
								  .css('border', stageExprShape.border)
								  .css('border-radius', stageExprShape.border_radius);
	
	$('#descriptive li span').css('padding-left', '5px').css('padding-right', '3px').css('margin-right', '4px');
}

function constructTabs(){
	
	var i, len;
	var tabIDs = '';
	for(i=0, len=htmlIngredient.tabsID.length-1; i<len; ++i){
		tabIDs += '#'+htmlIngredient.tabsID[i]+', ';
	}
	tabIDs += '#'+htmlIngredient.tabsID[i];
	$(function() {
		$( tabIDs ).tabs();
	});
}

//色選択部分作成
function makeColorSelecter(){
	
	$ol = $('<ol> </ol>');
	$ol.attr('id', 'selectable');

	var i, len;
	for(i=0, len=color.selectedColor.length; i<len; ++i){
		$li = $('<li> </li>');
		liTagID = generateID();
		$li.attr('id', liTagID);
		$li.addClass(CONST_KEYWORD.ui_state_default);
		$li.addClass(CONST_KEYWORD.colorSample);
		$li.css('background', color.selectedColor[i].col);
		$li.css('border-radius', '1.0em');
		color.selectedColor[i].liTagID = liTagID;
		$ol.append($li);
	}
	
	$('#colorSelecter').append($ol);
	$ol.selectable();
	$('#'+color.selectedColor[0].liTagID).addClass(CONST_KEYWORD.ui_selected)
}

//スクロール時の処理 (ステップナンバーラベルの移動)
$(window).scroll(function(){
	
    				var $this = $(this);
    				var scrollLeft = $this.scrollLeft();	    				
    				var i, len;
    				for(i=0, len=stepNumberLabels.length; i<len; ++i)
    					stepNumberLabels[i].div.style.left = stepNumberLabels[i].leftPos + scrollLeft+'px';
				});

function generateID(){
	return CONST_KEYWORD.id + htmlIngredient.idSeq++;
}

function makeDiv(divID){	//divタグを作成する
	
	var div = document.createElement('div');
	div.setAttribute('id', divID);
	return div;
}

function makeSpan(spanID){	//spanタグを作成する
	
	var span = document.createElement('span');
	span.setAttribute('id', spanID);
	return span;
}

function makeNode(xml, nodesArray, destNode){	//xml タグ名を元にDFGノードを作成する

	var nodeName = $(xml)[0].nodeName;
		
	if(nodeName===CONST_KEYWORD.ArrayAccess)
		return new ArrayAccess(xml, nodesArray, destNode);
	
	else if(nodeName===CONST_KEYWORD.Binary)
		return new Binary(xml, nodesArray, destNode);
		
	else if(nodeName===CONST_KEYWORD.Conditional)
		return new Conditional(xml, nodesArray, destNode);
			
	else if(nodeName===CONST_KEYWORD.Literal)
		return new Literal(xml, nodesArray, destNode);
		
	else if(nodeName===CONST_KEYWORD.MethodInv)
		return new MethodInv(xml, nodesArray, destNode);
		
	else if(nodeName===CONST_KEYWORD.Cast)
		return new TypeCast(xml, nodesArray, destNode);
	
	else if(nodeName===CONST_KEYWORD.Unary)
		return new Unary(xml, nodesArray, destNode);
		
	else if(nodeName===CONST_KEYWORD.UserDefined)
		return new UserDefined(xml, nodesArray, destNode);
		
	else if(nodeName===CONST_KEYWORD.VariableAccess)
		return new VariableAccess(xml, nodesArray, destNode);
		
	else 
		return null;
}

function removeSpace(string){
	return string.replace(/\s/g, '');
}

function extractInnerText(xml, tagName){
	
	if(xml===null)
		return null;	
	return removeSpace( $(xml).children(tagName).text() );
}

function extractInnerHTML(xml, tagName){
	
	if(xml===null)
		return null;
	return removeSpace( $(xml).children(tagName).html()+'' );
}

function removeHTMLComment(html){
	
	html = html.substring(4, html.length);
	html = html.substring(0, html.length-3);
	return html;
}

function calcWidthFromText(text, fontSize, font){
	return unit.nodeWidthMagRate*widthRuler(text, fontSize, font);
}

function widthRuler(text, fontSize, font){	//テキストの描画文字列幅を取得
	
	var ruler = $('#widthRuler').css('font-size',fontSize+'px').css('font-family', font);
	ruler.html(text);
	var width = ruler.width();
	ruler.html('');
	return width;
}

function heightRuler(text, fontSize, font){	//テキストの描画文字列幅を取得
	
	var ruler = $('#widthRuler').css('font-size',fontSize+'px').css('font-family', font);
	ruler.html(text);
	var height = ruler.height();
	ruler.html('');
	return height;
}

//フォントサイズの再計算
function reFontSize(fontSize, font, html, newWidth, newHeight){

	var strHeight = heightRuler(html, fontSize, font);
	var strWidth = widthRuler(html, fontSize, font);
	var expansion = (newHeight > strHeight && newWidth > strWidth);
	var diff = expansion ? 2 : -2;
	
	while(true){
		var isFitted = (function(fontSize){
			
				strHeight = heightRuler(html, fontSize, font);
				strWidth = widthRuler(html, fontSize, font);
				if(newHeight > strHeight && newWidth > strWidth)	//縦横ともに収まる
					return true;
				return false;
		})(fontSize+diff);
		
		if(expansion){	//文字を大きくする
			if(!isFitted){
				break;
			}
		}
		else{			//文字を小さくする
			if(isFitted){
				fontSize += diff;
				break;
			}
		}
		fontSize += diff;
	}
	return fontSize;
}

//ノードクリック時のイベントハンドラ
function selectNode(e){
	
	var thisComponentID;
	var infoTag;
	
	if(this.getAttribute(CONST_KEYWORD.dataComponentID) != null){	//コンポーネントIDがある　-> ノードタグがクリックされた
		thisComponentID = this.getAttribute(CONST_KEYWORD.dataComponentID);
	}
	else if(this.getAttribute(CONST_KEYWORD.dataParedNodeID) != null){	//詳細タグがクリックされた
		var id = this.getAttribute(CONST_KEYWORD.dataParedNodeID);
		var dfgNode = nodeIdHash[id];
		thisComponentID = dfgNode.componentID;
	}
	var i, len;
	var colIndex = null;

	var nodesOfSameComponent = nodeHash[thisComponentID];
	if(!nodesOfSameComponent[0].selected){	//未選択の場合着色する色を決定
		colIndex = findSelectedColor();
		
		if(color.selectedColor[colIndex].bindedComponentID!=null){	//選択された色がすでに使われている場合 -> すでに選択されているノードを未選択にし, 色を元に戻す
			var selectedNodes = nodeHash[color.selectedColor[colIndex].bindedComponentID];
			for(i=0, len=selectedNodes.length; i<len; ++i){
				changeNodeColor(selectedNodes[i], null);
			}
			changeDependenceVisibility(selectedNodes, false, null);
		}
		bindComponentID(colIndex, thisComponentID);	//選択済みノードと色の対応付け
		changeDependenceVisibility(nodesOfSameComponent, true, color.selectedColor[colIndex].col);
	}
	else{	//選択済みのノードがクリックされた場合 -> 選択済みノードの色とコンポーネントIDの対応付けを消す
		unbindComponentID(thisComponentID);
		changeDependenceVisibility(nodesOfSameComponent, false, null);
	}
	
	for(i=0, len=nodesOfSameComponent.length; i<len; ++i)
		changeNodeColor(nodesOfSameComponent[i], colIndex);

	autoSelectNextColor();
}

function changeNodeColor(node, colIndex){
	
	var componentID = node.divTag.getAttribute(CONST_KEYWORD.dataComponentID);
	var infoTag = node.nodeDetailDiv;

	if(!node.selected){	//未選択　 -> 色付け
	//if(colIndex!=null){	//未選択　 -> 色付け
		node.divTag.style.backgroundColor = color.selectedColor[colIndex].col;
		infoTag.style.backgroundColor = color.selectedColor[colIndex].col;
	}
	else{
		returnToOriginalCololr(node, infoTag);
	}
	node.selected = !node.selected;
}

//ノードを未選択のときの色に戻す
function returnToOriginalCololr(node, nodeInfoTag){
	
	if(node instanceof RegNode){
		node.divTag.style.backgroundColor = nodeShape.regColor;
		nodeInfoTag.style.backgroundColor = nodeInfoShape.regBackGroundColor;
	}
	else{
		node.divTag.style.backgroundColor = nodeShape.nodeColor;
		nodeInfoTag.style.backgroundColor = nodeInfoShape.nodeBackGroundColor;
	}
}

function changeDependenceVisibility(nodesOfSameComponent, visible, col){

	if(!(nodesOfSameComponent[0] instanceof VariableAccess) &&	//依存関係を持たないノード（ ArrayAccess, VariableDecl 以外 ）は取り扱わない
	   !(nodesOfSameComponent[0] instanceof ArrayAccess   ))
			return;
	
	if(visible===true){
		
		var showDependence = document.getElementById("variableDepend").checked;
		if(showDependence){
			var i, len;
			for(i=0, len=nodesOfSameComponent.length; i<len; ++i){
	
				var node = nodesOfSameComponent[i];
				if(node.dependenceSVG.length===0) //まだ依存関係を表す線が作られていない -> 作って描画
					node.createDependenceCntr(node.parentDFG.parentStage.$innerDiv, col);
				else
					node.reDrawDependenceCntr(col);	//すでに作られた line タグの属性を変更
					
				var j, jLen;
				for(j=0, jLen=node.dependenceSVG.length; j<jLen; ++j)
					node.dependenceSVG[j].setAttribute('visibility', 'visible');
			}
		}
	}
	else{
		for(i=0, len=nodesOfSameComponent.length; i<len; ++i){
			var node = nodesOfSameComponent[i];
			var j, jLen;
			for(j=0, jLen=node.dependenceSVG.length; j<jLen; ++j)
				node.dependenceSVG[j].setAttribute('visibility', 'hidden');
		}
	}
}

// 現在 UI上で選択されているカラーを探す
function findSelectedColor(){

	var i,len;
	for(i=0, len=color.selectedColor.length; i<len; ++i){
		if( $('#'+color.selectedColor[i].liTagID).hasClass(CONST_KEYWORD.ui_selected) )
			return i;
	}
	return 0;	//何色も選択されていない場合, 最初のカラーを選択している物とする
}

//色とコンポーネントIDの対応付けを消す
function unbindComponentID(componentID){
	
	var i,len;
	for(i=0, len=color.selectedColor.length; i<len; ++i)
		if( color.selectedColor[i].bindedComponentID == componentID )
			color.selectedColor[i].bindedComponentID = null;
}

//色とコンポーネントIDを対応付ける
function bindComponentID(colIndex, componentID){
	
	color.selectedColor[colIndex].bindedComponentID = componentID;
}

//ノードをクリックしたときに自動的に次の色を選択する
function autoSelectNextColor(){
	
	var i,len;
	
	for(i=0, len=color.selectedColor.length; i<len; ++i)
		$('#'+color.selectedColor[i].liTagID).removeClass(CONST_KEYWORD.ui_selected);
	
	for(i=0, len=color.selectedColor.length; i<len; ++i){
		if( color.selectedColor[i].bindedComponentID==null ){	//対応付けされていない色がある -> その色が次の選択色
			$('#'+color.selectedColor[i].liTagID).addClass(CONST_KEYWORD.ui_selected);
			return;
		}
	}
	$('#'+color.selectedColor[0].liTagID).addClass(CONST_KEYWORD.ui_selected);
}


function addNodeHash(nodeID, node){
	
	if( nodeHash[nodeID] === void 0){
		nodeHash[nodeID] = [node];
	}
	else{
		var nodeArray = nodeHash[nodeID];
		nodeArray[nodeArray.length] = node;
	}
}

function toggleVisibility($tag, e){
	
	if($tag.css('visibility')=='hidden'){
		$tag.css('visibility', 'visible');
		return true;
	}
	else{
		$tag.css('visibility', 'hidden');
		return false;
	}
}
