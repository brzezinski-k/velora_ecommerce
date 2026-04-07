<h1 align="center">Velora e-Commerce Sales Performance Analysis</h1>

<h2 align="center">Client Background</h2>
  <p>Velora is an EU-based fashion eCommerce company founded in 2019, selling clothes and accessories through its own website and online marketplaces.<br><br>Despite generating substantial data across sales, marketing, operations, and product performance, most of it has gone unused. This project digs into that data to surface insights that can meaningfully move the needle on Velora's commercial results.

Insights and recommendations are provided on the following key areas:
<ul>
	<li><b>Sales Trends Analysis: </b>Revenue, Total Orders and Average Order Value (AOV)</li>
	<li><b>Top Product Category Performance: </b> An analysis of the top generating product categories, understanding their impact on sales and returns.</li>
	<li><b>Regional Results: </b>Evaluating regional demand and product performance within regions to identify areas for improvement.</li>
</ul><br>

The goal was to identify where the business is performing well, where value is being lost, and what actions should be prioritized heading into 2026 in the top 3 countries.
  </p>
<p>Dashboard used for this analysis can be found <a href="https://github.com/brzezinski-k/velora_ecommerce/blob/main/Velora.pbix">here</a>.
Tools used in this analysis: Excel, PowerBI.</p>

<h1 align="center">Dataset Structure</h1>
  <p>The database consists of two tables: <b>fact_orders</b> and <b>fact_product</b>, totaling 80,000 records.</p>
  <p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/dataset_structure.png?raw=true" width="700"/>
  </p>
<h1 align="center">Executive Summary</h1>
<p>Revenue throughout the year was driven by AOV, with monthly order volume remaining stable in the 5,900–6,300 range. Q2 was the strongest quarter, primarily due to a revenue spike in April driven by seasonal demand peaks.<br>
DE, FR, and PL each generate approximately twice the revenue of an average market, making them the three key markets for the business.<br>
Tops, Dresses, Jeans, and Shoes were the top-performing product categories, collectively representing 61.3% of total revenue across 11 categories.<br>
Returns account for €9.67M in lost revenue, equivalent to a 30.46% return rate — consistent across all markets and product categories, indicating a systemic issue.<br>
<h3><b>Recommendations:</b></h3></p>
<ul>
	<li>Investigate return root causes, focusing on sizing accuracy, product descriptions, and return policy friction.</li>
	<li>Identify the drivers behind April's AOV peak and assess whether similar conditions can be replicated in weaker months.</li>
	<li>Resolve missing order date and product data (7.67% of orders) and unattributed country revenue (€1.45M) to improve analytical coverage.</li>
</ul>
<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/velora_dashboard.png?raw=true" width="700"/>
  </p>
<h1 align="center">Insight Deep Dive</h1>
<h2 align="center">Sales Trends</h2>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/sales_trends.png?raw=true" width="700"/>
</p>

<ul>
	<li>Q1 revenue and AOV remained stable throughout the quarter. March recorded the highest order volume of the year, while February achieved the strongest AOV within Q1.</li>
	<li>Q2 was the best-performing quarter by both revenue and AOV, delivering a €262K revenue increase and €13.08 AOV growth compared to Q1. Order volume was consistent across all three months, with only a 121-order difference between the lowest and highest months.</li>
	<li>Q3 experienced a downward trend driven by AOV decline. Revenue fell by €131K, and AOV dropped by €6.53 compared to Q2, while order volume remained largely unchanged. August showed a brief recovery — a €13.65 AOV increase and €63K revenue uplift — however, September reversed those gains, with AOV returning to July levels and revenue falling by €31K. Notably, September recorded the third-highest order volume of the year at 6,201 orders.</li>
	<li>Q4 saw order volume recover, with 305 more orders than Q3, yet AOV continued to decline. The net result was a marginal €9K revenue increase — illustrating that volume alone cannot compensate for falling AOV.</li>
</ul>
<p>Q4 recorded the highest order volume of the year, yet failed to overtake Q2 in revenue, with a €122K gap remaining. All four quarters maintained nearly identical order volumes, but differing AOV levels determined the revenue outcome in each case.</p>


<h2 align="center">Product Category Performance</h2>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/tops.png?raw=true" width="900"/>
</p>

<h3>Tops</h3>

Revenue and AOV move in opposite directions across quarters:
<ul>
	<li> When revenue rises (Q2), AOV falls, indicating volume-driven demand.</li> 
	<li>When revenue falls (Q3), AOV rises, pointing to a shift toward higher-value purchases.</li> 
</ul>
	This inverse relationship is a classic sign of product mix rotation rather than consistent growth.<br><br>Nord&Co holds 3 of the 9 top positions. Strong brand pull, but also a concentration risk — a single brand's decline could disproportionately affect category performance.<br><br><br>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/dresses.png?raw=true" width="900"/>
</p>

<h3>Dresses</h3>

Dresses show the clearest seasonal arc of all categories — sustained growth Q1 > Q3, then a sharp Q4 drop. This makes them highly predictable and inventory-plannable. However, Q3 top-2 SKUs accounted for ~50% of revenue, revealing high product concentration risk.<br><br>3 of the 8 top products are viscose. This material preference is a scalable attribute — new viscose SKUs have a validated demand foundation to build on.<br><br><br>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/jeans.png?raw=true" width="900"/>
</p>

<h3>Jeans</h3>

Jeans is the most volatile category — a 63% Q2 jump followed by a 20% Q3 decline. Sova Wool Burgundy generates ~10× more revenue than the #6 product. This extreme single-SKU dependency is the category's biggest risk factor.<br><br> Q4 recovers (+24%) driven by order volume, not AOV. This suggests new demand entry points — possibly promotional or seasonal — worth investigating for repeat expansion.<br><br><br>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/shoes.png?raw=true" width="900"/>
</p>

<h3>Shoes</h3>

Shoes peak in Q1 — the opposite of every other category. This makes them a natural Q1 revenue anchor, useful for balancing against weaker-performing categories in that period. The Q2 drop is largely explained by a product mix shift away from Marelli Merino Wool Green, which alone carries a €7K+ AOV. Marelli Merino Wool Green reaches €7.78K AOV in Q4, despite declining revenue — the highest value-per-order signal in the dataset. Increasing its order volume without discounting could drive disproportionate revenue gains.

<h2 align="center">Returns</h2>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/returns.png?raw=true" width="900"/>
</p>

<ul>
	<li>Q1 recorded €990K in refunded sales, establishing the baseline for the year and representing the lowest quarterly refund total.</li>
	<li>Q2 saw refunded sales increase by nearly €100K despite a slight decline in return rate. Tops were the primary driver, reaching €252K in refunded sales — the highest single-category quarterly figure of the year. The remaining increase came from Jeans (+€13K), Shoes (+€15K), and Bags (+€16K).</li>
	<li>Q3 refunded sales declined by €52K compared to Q2, with Tops (−€33K), Shoes (−€19K), and Accessories (−€12K) leading the reduction. This was partially offset by a €21K spike in Jeans refunds.</li>
	<li>Q4 was the strongest quarter for refunded sales at €1.117M — €127K above Q1 — potentially driven by post-Christmas gift returns. Accessories (+€23K) and Outerwear (+€19K) were the primary contributors to the quarterly increase. Tops remained the largest refunded sales category for the fourth consecutive quarter, making it the highest-risk category for returns across the full year.</li>
</ul>

<h2 align="center">Region Performance</h2>

<p align="center">
    <img src="https://github.com/brzezinski-k/velora_ecommerce/blob/main/countries.png?raw=true" width="900"/>
</p>

<p>DE, FR, and PL are the top 3 revenue-generating countries in 2025, each generating approximately twice the revenue of an average market across the dataset. Despite sharing near-identical order volumes throughout the year, all three markets show distinctly different behavioral profiles. Every revenue and AOV difference observed is driven entirely by product mix rotation, making merchandising and inventory allocation the primary levers for performance improvement across all three markets.</p>

<h3>Germany</h3>

<p>Germany performs best in Q2 and Q3, with Q4 the weakest — revenue declining by over €100K and AOV dropping from €377 to €307. This is a product mix problem: Outerwear, Tops, and Dresses all weaken simultaneously with no offsetting growth elsewhere.
Shoes carry the most acute brand concentration risk in the dataset. Marelli SKUs dominated H1, peaking at nearly 50% of category revenue in Q2, before disappearing entirely by Q4 — leaving no second brand to cover H2.
Accessories is anchored solely by Kids&Joy Polyester Olive, operating on 1–3 high-value orders per quarter, with no second-tier SKU to absorb any drop in that product's performance.</p>

<h3>France</h3>

<p>France is the most stable revenue market, with AOV fluctuating while overall revenue holds steady.
The standout finding is Skirts — the only category in the dataset to grow both revenue and AOV every quarter, with revenue up approximately 200% and AOV more than doubling from Q1 to Q4. This is driven by two complementary SKUs creating a year-round seasonal relay: Marelli Organic Cotton Black Skirt in Q2–Q3 and Biała Label cashmere navy skirt in Q1 and Q4.
Dress ID 335 grew revenue 13x from Q1 to Q3 before recording no sales in Q4 — a disappearance that warrants investigation as a potentially recoverable revenue opportunity for 2026.</p>

<h3>Poland</h3>

<p>Poland is the most consistent market, maintaining stable revenue and AOV across all four quarters with no significant dips. Its Q1 strength — the strongest Q1 of the three countries — is directly explained by shoes over-indexing in Poland, a category that peaks in Q1 across the dataset. Poland's consistency makes it the least analytically complex of the three markets, which is itself a notable finding: stable demand, no category concentration risk, and no significant seasonal volatility suggest a well-balanced product mix relative to local demand.</p>

<h1 align="center">Recommendations</h1>

<h3>Products</h3>
<ul>
	<li>Expand top-performing lines and increase inventory depth on the top 9 SKUs to capitalize on the stable demand floor.</li>
	<li>Increase stock and marketing for dresses ahead of Q2, reduce exposure in Q1 and Q4 to minimize holding costs and markdowns.</li>
	<li>Audit Sova Wool Burgundy success drivers (fit, material, pricing, reviews) and replicate attributes across 2–3 new SKUs to de-risk the category.</li>
	<li>Activate high-AOV products with bundling. Bundling Marelli Merino Wool Green shoes (€7.78K AOV) with complementary items could increase revenue per transaction without requiring more orders.</li>
	<li>Viscose dresses and Nord&Co tops have proven demand. Introduce new SKUs sharing these attributes to test scalability before broad assortment expansion.</li>
	<li>Audit all SKUs below €10K revenue for cross-sell value; remove those with no measurable contribution.</li>
</ul>

<h3>Returns</h3>
<ul>
	<li>Review sizing accuracy, product descriptions, and photography quality for the top-selling tops SKUs</li>
	<li>Cross-reference the jeans refund spike in Q2 and Q3 with specific SKUs.</li>
	<li>Create clearer gift sizing guidance at checkout, extended exchange windows as an alternative to full returns, and targeted post-Christmas retention campaigns</li>
</ul>

<h3>Regions</h3>
<ul>
	<li>Ensure at least one high-AOV category in Germany is actively supported entering Q4 2026 to prevent outerwear, tops, and dresses weakening simultaneously with no offset.</li>
	<li>Onboard a second shoes brand in Germany before Q3 2026 to avoid repeating the H2 revenue cliff caused by full Marelli withdrawal.</li>
	<li>Investigate Dress ID 335 disappearance in FR — determine whether the Q4 absence was a stockout, delisting, or listing error and restore availability for 2026.</li>
	<li>Replicate the FR Skirts relay model — apply the complementary two-SKU seasonal handoff approach to underperforming categories in DE and PL.</li>
	<li>Avoid disruptive assortment or promotional changes that could destabilise Poland's consistent cross-quarter performance.</li>
</ul>
