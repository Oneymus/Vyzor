<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE MudletPackage>
<MudletPackage version="1.0">
    <TriggerPackage>
        <Trigger isActive="yes" isFolder="no" isTempTrigger="no" isMultiline="no" isPerlSlashGOption="no" isColorizerTrigger="no" isFilterTrigger="no" isSoundTrigger="no" isColorTrigger="no" isColorTriggerFg="no" isColorTriggerBg="no">
            <name>TestChat</name>
            <script>local chat_list = {&quot;john&quot;, &quot;jane&quot;, &quot;b o b&quot;}
local chat2_list = {&quot;billy&quot;, &quot;bubba&quot;, &quot;gertrude&quot;, &quot;agnis&quot;}

local n
for _, name in ipairs( chat_list ) do
	if matches[2] == name then
		n = 1
		break
	end
end

if not n then
	for _, name in ipairs( chat2_list ) do
		if matches[2] == name then
			n = 2
			break
		end
	end
end

if not n then
	error( &quot;Unmatched name!&quot; )
end

if n == 1 then
	if matches[2] == &quot;john&quot; then
		chat:Echo( matches[2], line )
	elseif matches[2] == &quot;jane&quot; then
		chat:Paste( matches[2] )
	else
		chat:Append( matches[2] )
	end

elseif n == 2 then
	if matches[2] == &quot;billy&quot; then
		chat2:Paste( matches[2] )
	elseif matches[2] == &quot;bubba&quot; then
		chat2:Append( matches[2] )
	else
		chat2:Echo( matches[2], line )
	end
end</script>
            <triggerType>0</triggerType>
            <conditonLineDelta>0</conditonLineDelta>
            <mStayOpen>0</mStayOpen>
            <mCommand></mCommand>
            <packageName></packageName>
            <mFgColor>#ff0000</mFgColor>
            <mBgColor>#ffff00</mBgColor>
            <mSoundFile></mSoundFile>
            <colorTriggerFgColor>#000000</colorTriggerFgColor>
            <colorTriggerBgColor>#000000</colorTriggerBgColor>
            <regexCodeList>
                <string>^\[(.+)\]: (.+) $</string>
            </regexCodeList>
            <regexCodePropertyList>
                <integer>1</integer>
            </regexCodePropertyList>
        </Trigger>
    </TriggerPackage>
    <TimerPackage/>
    <AliasPackage>
        <Alias isActive="yes" isFolder="no">
            <name>Unload Vyzor</name>
            <script>echo(&quot;Vyzor: Unloading modules...\n&quot;)
for index in pairs( package.loaded ) do
	if index:find( &quot;vyzor&quot;, 1, true ) then
		echo(string.format(&quot;Vyzor: Found module %s.\n&quot;, index))
		package.loaded[index] = nil
	end
end
echo(&quot;Vyzor: Unloaded all modules.\n&quot;)
Vyzor = nil</script>
            <command></command>
            <packageName></packageName>
            <regex>^U$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>Change Options</name>
            <script>-- There appears to be a Mudlet bug: the scroll bar isn't
-- adjusted properly after the resize. Text comes in where
-- it's supposed to be, though.
Vyzor.Options.Borders = {Top = 0.3, Bottom = &quot;dynamic&quot;}</script>
            <command></command>
            <packageName></packageName>
            <regex>^co$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>Reset Profile</name>
            <script>Vyzor.Options:Reset()</script>
            <command></command>
            <packageName></packageName>
            <regex>^rp$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>Test Vyzor</name>
            <script>-- Change this file for testing.
local image_file = [[C:/Users/Administrator/.config/mudlet/profiles/Midkemia Online/Vyzor/eq_light.png]]

local border = Vyzor.Border(
	10,
	Vyzor.BorderStyle.Groove,
	Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.Name, &quot;white&quot; ) )
)
local margin = Vyzor.Margin( 5 )
local padding = Vyzor.Padding( 5 )
local green = Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.Name, &quot;green&quot; ) )
local background = Vyzor.Background( green )
local image = Vyzor.Image( image_file,
	 Vyzor.Alignment.Center )
local img_back = Vyzor.Background( image )
local img_border = Vyzor.Border( nil, nil, image )

Vyzor.HUD.Frames[&quot;VyzorTop&quot;]:Add( border )
Vyzor.HUD.Frames[&quot;VyzorTop&quot;]:Add( margin )
Vyzor.HUD.Frames[&quot;VyzorTop&quot;]:Add( padding )
Vyzor.HUD.Frames[&quot;VyzorTop&quot;]:Add( image )

Vyzor.HUD.Frames[&quot;VyzorBottom&quot;]:Add( border )
Vyzor.HUD.Frames[&quot;VyzorBottom&quot;]:Add( margin )
Vyzor.HUD.Frames[&quot;VyzorBottom&quot;]:Add( padding )
Vyzor.HUD.Frames[&quot;VyzorBottom&quot;]:Add( background )

Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( border )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( margin )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( padding )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( img_back )

Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( img_border )
Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( margin )
Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( image )

local right_frame = Vyzor.Frame( &quot;right_frame&quot;, .2, .3, .6, .4 )
right_frame:Add( border )
right_frame:Add( background )
right_frame:Add( padding )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( &quot;right_frame&quot; )

local inner_right = Vyzor.Frame( &quot;inner_right&quot;, 0, 0, 1, 1 )
inner_right:Add( border )
inner_right:Add( img_back )
inner_right:Add( padding )
right_frame:Add( inner_right )

local inner_inner = Vyzor.Frame( &quot;inner_inner&quot;, 0, 0, 1, 1 )
inner_inner:Add( img_border )
inner_inner:Add( padding )
inner_right:Add( &quot;inner_inner&quot; )

local so_deep = Vyzor.Frame( &quot;so_deep&quot;, 0, 0, 1, 1 )
--so_deep:Add( background )
so_deep:Add( border )
so_deep:Add( padding )
inner_inner:Add( so_deep )

local enough = Vyzor.Frame( &quot;enough&quot;, 0, 0, 1, 1 )
enough:Add( border )
enough:Add( image )
so_deep:Add( enough )

--Vyzor.HUD:Draw()
second_tc = false
expandAlias(&quot;tc&quot;)</script>
            <command></command>
            <packageName></packageName>
            <regex>^tv$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestConsole</name>
            <script>if not second_tc then
	local console_one = Vyzor.MiniConsole( &quot;console_one&quot;, 0, 0, .5, .3 )
	local console_two = Vyzor.MiniConsole( &quot;console_two&quot;, .5, .3, .5, .3, 10 )
	local console_three = Vyzor.MiniConsole( &quot;console_three&quot;, 0, .6, .5, .3, nil, 15 )
	local console_four = Vyzor.MiniConsole( &quot;console_four&quot;, 0, .3, .5, .3, 80 )

	Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( console_one )
	Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( console_two )
	Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( console_three )
	Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( console_four )

	--Vyzor.HUD:Draw()
	expandAlias( &quot;tg&quot; )

	for i=1, 100 do
		echo( &quot;console_one&quot;, i .. &quot; &quot; )
		echo( &quot;console_two&quot;, i .. &quot; &quot; )
		echo( &quot;console_three&quot;, i .. &quot; &quot; )
		echo( &quot;console_four&quot;, i .. &quot; &quot; )
	end
end

if second_tc then
	local num_tbl = {&quot;one&quot;, &quot;two&quot;, &quot;three&quot;, &quot;four&quot;}
	local randex = num_tbl[math.random(#num_tbl)]

	if math.random(2) == 1 then
		local rndm = math.random(10, 101)
		Vyzor.HUD.Frames[&quot;VyzorLeft&quot;].MiniConsoles[&quot;console_&quot; .. randex].WordWrap = 
			(rndm == 101 and &quot;dynamic&quot;) or rndm
		echo(string.format(&quot;Setting console_%s.WordWrap to %s.\n&quot;,
			randex, (rndm == 101 and &quot;dynamic&quot;)or rndm))
	else
		local rndm = math.random(5, 16)
		Vyzor.HUD.Frames[&quot;VyzorLeft&quot;].MiniConsoles[&quot;console_&quot; .. randex].FontSize = 
			(rndm == 16 and &quot;dynamic&quot;) or rndm
		echo(string.format(&quot;Setting console_%s.FontSize to %s.\n&quot;,
			randex, (rndm == 16 and &quot;dynamic&quot;)or rndm))
	end
end

second_tc = true</script>
            <command></command>
            <packageName></packageName>
            <regex>^tc$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestMap</name>
            <script>local map = Vyzor.Map( 0, .7, 1, .3 )

Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( map )

Vyzor.HUD:Draw()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tm$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestGauges</name>
            <script>stat = {
	current = 1,
	maximum = 100
}

local back_color = Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, &quot;50%&quot;, 0, 0 ) )
local front_color = Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 255, 0, 0 ) )

local back_back = Vyzor.Background( back_color )
local front_back = Vyzor.Background( front_color )

local gauge_back1 = Vyzor.Frame( &quot;gauge_back&quot;, 0, .7, .5, .1 )
gauge_back1:Add( back_back )
local gauge_front1 = Vyzor.Frame( &quot;gauge_front&quot; )
gauge_front1:Add( front_back )

local gauge1 = Vyzor.Gauge( &quot;gauge1&quot;, &quot;stat.current&quot;, &quot;stat.maximum&quot;, gauge_back1, gauge_front1 )

local gauge_back2 = Vyzor.Frame( &quot;gauge_back2&quot;, 0, .8, .5, .1 )
gauge_back2:Add( back_back )
local gauge_front2 = Vyzor.Frame( &quot;gauge_front2&quot; )
gauge_front2:Add( front_back )

local gauge2 = Vyzor.Gauge( &quot;gauge2&quot;, &quot;stat.current&quot;, &quot;stat.maximum&quot;, gauge_back2, gauge_front2,
	Vyzor.GaugeFill.RightLeft )

local gauge_back3 = Vyzor.Frame( &quot;gauge_back3&quot;, .6, .7, .1, .2 )
gauge_back3:Add( back_back )
local gauge_front3 = Vyzor.Frame( &quot;gauge_front3&quot; )
gauge_front3:Add( front_back )

local gauge3 = Vyzor.Gauge( &quot;gauge3&quot;, &quot;stat.current&quot;, &quot;stat.maximum&quot;, gauge_back3, gauge_front3,
	Vyzor.GaugeFill.BottomTop )

local gauge_back4 = Vyzor.Frame( &quot;gauge_back4&quot;, .8, .7, .1, .2 )
gauge_back4:Add( back_back )
local gauge_front4 = Vyzor.Frame( &quot;gauge_front4&quot; )
gauge_front4:Add( front_back )

local gauge4 = Vyzor.Gauge( &quot;gauge4&quot;, &quot;stat.current&quot;, &quot;stat.maximum&quot;, gauge_back4, gauge_front4,
	Vyzor.GaugeFill.TopBottom )

Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( gauge1 )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( gauge2 )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( gauge3 )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( gauge4 )

Vyzor.HUD:Draw()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tg$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestGaugeUpdate</name>
            <script>stat = stat or {
	health = {
		current = 1,
		maximum = 100
	},
	mana = {
		current = 1,
		maximum = 100
	},
	endurance = {
		current = 1,
		maximum = 100
	},
	willpower = {
		current = 1,
		maximum = 100
	},
	xp = {
		current = 1,
		maximum = 100
	},
}

stat.health.current = math.random(100)
stat.mana.current = math.random(100)
stat.endurance.current = math.random(100)
stat.willpower.current = math.random(100)
stat.xp.current = math.random(500)

VyzorGaugeUpdate()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tgu$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestColors</name>
            <script>local test = Vyzor.Frame(&quot;color_test&quot;, .3, .3, .3, .3)
test:Add( Vyzor.Color(Vyzor.ColorMode.Name, &quot;green&quot;))
test:Add( Vyzor.Background(
	Vyzor.Brush(
		Vyzor.Color( Vyzor.ColorMode.RGBA, 100, 0, 0 )
	)
))

Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add(test)

echo(test.Stylesheet)

Vyzor.HUD:Draw()

test:Echo(&quot;This is only a test.\n&quot;)</script>
            <command></command>
            <packageName></packageName>
            <regex>^tco$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestBox</name>
            <script>local ROWS = 5
local COLS = 3
local CELLS = 2

local MODE = Vyzor.BoxMode.Grid

local id = 0

--echo(&quot;Starting box test...\n&quot;)
for i = 1, ROWS do
--	echo(&quot;  row: &quot; .. i .. &quot;\n&quot;)

	for j = 1, COLS do
--		echo(&quot;    column: &quot; .. j .. &quot;\n&quot;)
		local container_name 	= &quot;test_container_&quot; .. i .. &quot;:&quot; .. j
		local box_name 			= &quot;test_box_&quot; .. i .. &quot;:&quot; .. j

		local cell_num = CELLS

		local cells = {}
		for k = 1, cell_num do
--			echo(&quot;      cell: &quot; .. k .. &quot;\n&quot;)
			local cell_name = &quot;test_cell_&quot; .. i .. &quot;:&quot; .. j .. &quot;.&quot; .. k
--			echo(&quot;        name: &quot; .. cell_name .. &quot;\n&quot;)

			local cell = Vyzor.Frame( cell_name )
			cell:Add(
				Vyzor.Background(
					Vyzor.Brush(
						Vyzor.Color( Vyzor.ColorMode.RGB, math.random(255), math.random(255), math.random(255) )
					)
				)
			)

			cells[#cells+1] = cell
			id = id + 1
		end
		CELLS = CELLS + 1

--		echo(&quot;      container: &quot; .. container_name .. &quot;\n&quot;)
		local x = (((j - 1) * COLS) * .1)
--		echo(&quot;        x: &quot; .. x .. &quot;\n&quot;)
		local y = (1 / ROWS * (i - 1))
--		echo(&quot;        y: &quot; .. y .. &quot;\n&quot;)
		local w = (1/COLS) - .1
--		echo(&quot;        w: &quot; .. w .. &quot;\n&quot;)
		local h = (1/ROWS) - .1
--		echo(&quot;        h: &quot; .. h .. &quot;\n&quot;)

		local container = Vyzor.Frame( container_name, x, y, w, h )
		container:Add(
			Vyzor.Border( 5, Vyzor.BorderStyle.Groove, 
				Vyzor.Brush( 
					Vyzor.Color( Vyzor.ColorMode.RGB, math.random(255), math.random(255), math.random(255) )
				)
			)
		)
--		echo(&quot;      box: &quot; .. box_name .. &quot;\n&quot;)
		local box = Vyzor.Box( box_name, MODE, container, cells )

		Vyzor.Left:Add( box )
	end
end

local control_container = Vyzor.Frame( &quot;control_container&quot;, .3, .3, .3, .3 )
control_container:Add(
	Vyzor.Border( 5, Vyzor.BorderStyle.Groove, 
		Vyzor.Brush( 
			Vyzor.Color( Vyzor.ColorMode.RGB, math.random(255), math.random(255), math.random(255) )
		)
	)
)

local control_cell = Vyzor.Frame( &quot;control_cell&quot; )
control_cell:Add(
	Vyzor.Background(
		Vyzor.Brush(
			Vyzor.Color( Vyzor.ColorMode.RGB, math.random(255), math.random(255), math.random(255) )
		)
	)
)
Vyzor.Right:Add(
	Vyzor.Box( &quot;control_box&quot;, MODE, control_container, { control_cell } )
)

--echo(&quot;\nDrawing box test...\n&quot;)
Vyzor.HUD:Draw()
--echo(&quot;\nBox test complete.\n&quot;)</script>
            <command></command>
            <packageName></packageName>
            <regex>^tb$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestGradients</name>
            <script>grad_red 		= Vyzor.Color( Vyzor.ColorMode.RGB, &quot;100%&quot;, 0, 0 )

grad_blue 	= Vyzor.Color( Vyzor.ColorMode.RGB, 0, 0, &quot;100%&quot; )

grad_green 	= Vyzor.Color( Vyzor.ColorMode.RGB, 0, &quot;100%&quot;, 0 )

grad_white 	= Vyzor.Color( Vyzor.ColorMode.RGB, &quot;100%&quot;, &quot;100%&quot;, &quot;100%&quot; )

grad_what 	= Vyzor.Color( Vyzor.ColorMode.RGB, math.random(255), math.random(255), math.random(255) )


local lin_grad = Vyzor.Gradient( Vyzor.GradientMode.Linear,
	0.0, 0.0, 1.0, 1.0,
	{0.2, grad_red}, {0.4, grad_blue}, {0.6, grad_green}, {0.8, grad_white}, {1.0, grad_what}
)

local rad_grad = Vyzor.Gradient( Vyzor.GradientMode.Radial,
	0.0, 0.0, 1.0, 1.0, 1.0, 
	{0.2, grad_red}, {0.4, grad_blue}, {0.6, grad_green}, {0.8, grad_white}, {1.0, grad_what}
)

local con_grad = Vyzor.Gradient( Vyzor.GradientMode.Conical,
	0.5, 0.5, 45, 
	{0.2, grad_red}, {0.4, grad_blue}, {0.6, grad_green}, {0.8, grad_white}, {1.0, grad_what}
)

local lin_back = Vyzor.Background( Vyzor.Brush( lin_grad ) )
local rad_back = Vyzor.Background( Vyzor.Brush( rad_grad ) )
local con_back = Vyzor.Background( Vyzor.Brush( con_grad ) )

local lin_frame = Vyzor.Frame( &quot;lin_frame&quot;, 0.3, 0.1, 0.3, 0.3 )
local rad_frame = Vyzor.Frame( &quot;rad_frame&quot;, 0.3, 0.4, 0.3, 0.3 )
local con_frame = Vyzor.Frame( &quot;con_frame&quot;, 0.3, 0.7, 0.3, 0.3 )

lin_frame:Add( lin_back )
rad_frame:Add( rad_back )
con_frame:Add( con_back )

Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( lin_frame )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( rad_frame )
Vyzor.HUD.Frames[&quot;VyzorRight&quot;]:Add( con_frame )

Vyzor.HUD:Draw()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tgr$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestChat</name>
            <script>local chat_back = Vyzor.Frame( &quot;chat_background&quot;, 0, 0, 1, .5 )
chat_back:Add( Vyzor.Border( 5, Vyzor.BorderStyle.Groove,
		Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 0, 255, 0 ) ),
		5
	)
)

local tab_border = Vyzor.Border( 2, Vyzor.BorderStyle.DotDotDash,
	Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 255, 0, 0 ) ),
	1
)

chat = Vyzor.Chat( &quot;test_chat&quot;, chat_back, {&quot;All&quot;, &quot;john&quot;, &quot;jane&quot;, &quot;b o b&quot;}, Vyzor.TabLocation.Left, 
	.3, nil, nil, {Vyzor.Color( Vyzor.ColorMode.Name, &quot;white&quot; ), tab_border}
)

Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( chat )

local chat_back2 = Vyzor.Frame( &quot;chat_back2&quot;, 0, .5, 1, .5 )
chat_back2:Add( Vyzor.Border( 5, Vyzor.BorderStyle.Ridge,
	Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 0, 0, 255 ) )
	)
)

chat2 = Vyzor.Chat( &quot;test_chat2&quot;, chat_back2, {&quot;billy&quot;, &quot;bubba&quot;, &quot;gertrude&quot;, &quot;agnis&quot;}, Vyzor.TabLocation.Right,
	nil, nil, nil, {Vyzor.Color( Vyzor.ColorMode.RGB, 236, 75, 16 ), 
		Vyzor.Background( Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 0, 0, 255 ) ) )}
)

Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( chat2 )

Vyzor.HUD.Frames[&quot;VyzorLeft&quot;]:Add( Vyzor.Border( 5, Vyzor.BorderStyle.Solid,
	Vyzor.Brush(
		Vyzor.Color( Vyzor.ColorMode.Name, &quot;pink&quot; )
	),
	5
))

Vyzor.HUD.Draw()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tch$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>TestConverse</name>
            <script>
function saySomething ()
	local chan_list = {&quot;john&quot;, &quot;jane&quot;, &quot;b o b&quot;, &quot;billy&quot;, &quot;bubba&quot;, &quot;gertrude&quot;, &quot;agnis&quot;}
	local chan = chan_list[math.random(#chan_list)]

	local alpha = &quot;abcdefghijklmnopqrstuvwxyz&quot;

	local text = string.format(&quot;[%s]: %s&quot;,
		chan,
		string.rep( alpha:sub(math.random(13), math.random(14, 26)) .. &quot; &quot;, math.random( 10 ) )
	)

	feedTriggers( text .. &quot;\n&quot; )
	echo( &quot;\n&quot; )
end

for i=1, 20 do
	tempTimer( math.random(10), saySomething )
end</script>
            <command></command>
            <packageName></packageName>
            <regex>^fillchat$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>Vyzor Help</name>
            <script>if openWebPage then
	openWebPage( getMudletHomeDir():gsub(&quot;\\&quot;, &quot;/&quot;) .. &quot;/vyzor/doc/index.html&quot; )
else
	openUrl( getMudletHomeDir():gsub(&quot;\\&quot;, &quot;/&quot;) .. &quot;/vyzor/doc/index.html&quot; )
end
		</script>
            <command></command>
            <packageName></packageName>
            <regex>^vy(?:zor)?\s?h(?:elp)?$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>Test non-Border Frames</name>
            <script>local width = Vyzor.HUD.Size.AbsoluteWidth
local height = Vyzor.HUD.Size.AbsoluteHeight
for i=1, 10 do
	local frame = Vyzor.Frame( &quot;name&quot; .. i, width * ((i - 1) * .1), height * ((i - 1) * .1), .1, .1 )
	frame:Add(
		Vyzor.Background(
			Vyzor.Brush( Vyzor.Color( Vyzor.ColorMode.RGB, 255 * ((i - 1) * .1), 255 * ((i - 1) * .1), 255 * ((i - 1) * .1) ) )
		)
	)
	Vyzor.HUD:Add( frame )
end

Vyzor.HUD:Draw()</script>
            <command></command>
            <packageName></packageName>
            <regex>^tnbf$</regex>
        </Alias>
        <Alias isActive="yes" isFolder="no">
            <name>vyzor</name>
            <script></script>
            <command></command>
            <packageName></packageName>
            <regex></regex>
        </Alias>
    </AliasPackage>
    <ActionPackage/>
    <ScriptPackage>
        <Script isActive="yes" isFolder="no">
            <name>Vyzor</name>
            <packageName></packageName>
            <script>-- Uncomment this out for quick reloading of Vyzor files.
--expandAlias(&quot;U&quot;)

if not Vyzor then
	echo(&quot;Vyzor: Loading modules...\n&quot;)

	local path = package.path
	local homeDirectory = getMudletHomeDir():gsub(&quot;\\&quot;, &quot;/&quot;)
	
	local luaDirectory = string.format(&quot;%s/%s&quot;, homeDirectory, [[?.lua]])
	local initDirectory = string.format(&quot;%s/%s&quot;, homeDirectory, [[?/init.lua]])
	package.path = string.format(&quot;%s;%s;%s&quot;, luaDirectory, initDirectory, path)

	local okay, content = pcall(require, &quot;vyzor&quot;)
	package.path = path

	if okay then
		Vyzor = content
	else
		error(string.format(&quot;Vyzor: Error loading module: %s.\n&quot;, content))
	end

	if Vyzor then
		echo(&quot;Vyzor: Modules successfully loaded.\n&quot;)
	end

	tempTimer( 0, function () raiseEvent( &quot;VyzorLoadEvent&quot; ) end )
end</script>
            <eventHandlerList/>
        </Script>
    </ScriptPackage>
    <KeyPackage/>
</MudletPackage>
