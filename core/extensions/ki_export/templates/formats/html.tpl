<html>
  <head>
    <title></title>
    <meta content="">
    
{literal}
	<style type="text/css" media="screen">
		body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td {
		  margin: 0;
		  padding: 0;
		}
		table {
		  border-collapse: collapse;
		  border-spacing: 0;
		}
		fieldset, img { border: 0; }
		address, caption, cite, code, dfn, em, strong, th, var {
		  font-style: normal;
		  font-weight: normal;
		}
		ol, ul { list-style: none; }
		caption, th { text-align: left; }
		h1, h2, h3, h4, h5, h6 {
		  font-size: 100%;
		  font-weight: normal;
		}
		q:before { content: ''; }
		q:after { content: ''; }
		abbr, acronym { border: 0; }
		th {
		  text-align: left;
		  font-weight: bold;
		}
		th {
		  border-right: 1px solid #999999;
		  padding: 5px;
		}
		th:first-child { border-left: 1px solid #999999; }
		td {
		  border-right: 1px solid #999999;
		  padding: 5px;
		}
		td:first-child { border-left: 1px solid #999999; }
		h1 {
		  font-size: 150%;
		  font-weight: bold;
		  margin-bottom: 10px;
		}
		
		
		
		body {
			color: black;
			font-family: Arial, Verdana, sans-serif;
			font-size: 11px;
		}

		th {
			background: #ccc;
			border-top: 1px solid #999;
			border-bottom: 1px solid #999;
			font-family: Arial, Verdana, sans-serif;
			font-size: 11px;
			font-weight: normal;
		}

		td {
			border-bottom: 1px solid #999;
			font-family: Arial, Verdana, sans-serif;
			font-size: 11px;
		}

		#div_selectform {
			display: none;
		}

		#div_liste {

		}

		#invertbtn, .invertclm {
			display: none;
		}
	</style>


{/literal}
  </head>
  <body>

          <table border="1">
            <tbody>

{*column headers------------------------------------------------*}
                <tr>
{ if $columns.date         } <td>{$kga.lang.datum}</td>       { /if }
{ if $columns.from         } <td>{$kga.lang.in}</td>          { /if }
{ if $columns.to           } <td>{$kga.lang.out}</td>         { /if }
{ if $columns.time         } <td>{$kga.lang.time}</td>        { /if }
{ if $columns.dec_time     } <td>{$kga.lang.timelabel}</td>   { /if }
{ if $columns.rate         } <td>{$kga.lang.rate}</td>        { /if }
{ if $columns.wage         } <td>Euro</td>                    { /if }
{ if $columns.knd          } <td>{$kga.lang.knd}</td>         { /if }
{ if $columns.pct          } <td>{$kga.lang.pct}</td>         { /if }
{ if $columns.action       } <td>{$kga.lang.evt}</td>         { /if }
{ if $columns.comment      } <td>{$kga.lang.comment}</td>     { /if }
{ if $columns.location     } <td>{$kga.lang.location}</td>    { /if }
{ if $columns.trackingnr   } <td>{$kga.lang.trackingnr}</td>  { /if }
{ if $columns.user         } <td>{$kga.lang.user}</td>        { /if }
{ if $columns.cleared      } <td>{$kga.lang.cleared}</td>     { /if }

                </tr>
               
{section name=row loop=$arr_data}

    
                <tr>
    
{*datum --------------------------------------------------------*}
{ if $columns.date }
                    <td>
                        { if $custom_dateformat }
                        {$arr_data[row].time_in|date_format:$custom_dateformat}
                        { else }
                        {$arr_data[row].time_in|date_format:$kga.date_format.1}
                        { /if }
                    </td>
{/if}

{*in -----------------------------------------------------------*}
{ if $columns.from }
                    <td>
                        { if $custom_timeformat }
                        {$arr_data[row].time_in|date_format:$custom_timeformat}
                        { else }
                        {$arr_data[row].time_in|date_format:"%H:%M"}
                        { /if }
                    </td>
{/if}

{*out ----------------------------------------------------------*}
{ if $columns.to }
                    <td>
                    
{if $arr_data[row].time_out}
                        { if $custom_timeformat }
                        {$arr_data[row].time_out|date_format:$custom_timeformat}
                        { else }
                        {$arr_data[row].time_out|date_format:"%H:%M"}
                        { /if }
{else}                     
                        &ndash;&ndash;:&ndash;&ndash;
{/if}
                    </td>
{/if}

{*task time ----------------------------------------------------*}
{ if $columns.time }
                    <td>
                    
{if $arr_data[row].zef_time}

                            {$arr_data[row].zef_apos}
                      
{else}  
                        &ndash;:&ndash;&ndash;
{/if}
                    </td>
{/if}

{*decimal time --------------------------------------------------*}
{ if $columns.dec_time }
                    <td>
                    
{if $arr_data[row].dec_zef_time}
                            {$arr_data[row].dec_zef_time}
                      
{else}  
                        &ndash;:&ndash;&ndash;
{/if}
                    </td>
{/if}

{*rate ---------------------------------------------------------*}
{ if $columns.rate }
                    <td>
                    
                            {$arr_data[row].zef_rate}
                    </td>
{/if}

{*task wage ----------------------------------------------------*}
{ if $columns.wage }
                    <td>
                    
{if $arr_data[row].wage}
                    
                        {$arr_data[row].wage}
                      
{else}  
                        &ndash;
{/if}
                    </td>
{/if}

{*client name --------------------------------------------------*}
{ if $columns.knd }
                    <td>
                        {$arr_data[row].knd_name}
                    </td>
{/if}

{*project name -------------------------------------------------*}
{ if $columns.pct }
                    <td>
                            {$arr_data[row].pct_name}
                    </td>
{/if}


{*event name and comment bubble --------------------------------*}
{ if $columns.action }
                    <td>
                            {$arr_data[row].evt_name} 
                    </td>
{/if}

{*comment -----------------------------------------------------*}
{ if $columns.comment }
                    <td>
                        {$arr_data[row].comment|nl2br}
                    </td>
{/if}

{*location ----------------------------------------------------*}
{ if $columns.location }
                    <td>
                        {$arr_data[row].location}
                        
                    </td>
{/if}

{*tracking number ---------------------------------------------*}
{ if $columns.trackingnr }
                    <td>
                        {$arr_data[row].trackingnr}
                        
                    </td>
{/if}

{*user --------------------------------------------------------*}
{ if $columns.user }
                    <td>
                        {$arr_data[row].username}
                        
                    </td>
{/if}

{*cleared -----------------------------------------------------*}
{ if $columns.cleared }
					<td>
                      {if $arr_data[row].cleared}cleared{else}{/if}
					</td>
{/if}
					

                </tr>
               
{/section}
                
            </tbody>   
        </table>

</body>
</html>