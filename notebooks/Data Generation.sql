-- Databricks notebook source
-- Create the program table if it doesn't already exist
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.program (
  program_id    INT,
  program_name   STRING,
  school         STRING,
  degree_level   STRING
)
USING DELTA;

-- Clear any existing rows so the insert is idempotent
TRUNCATE TABLE admissions_mvp.curated.program;

-- Insert 50 realistic, unique academic programs
INSERT INTO admissions_mvp.curated.program (program_id, program_name, school, degree_level)
VALUES
  -- Engineering
  ( 1, 'Bachelor of Mechanical Engineering',            'School of Engineering',            'Undergraduate'),
  ( 2, 'Bachelor of Civil Engineering',                 'School of Engineering',            'Undergraduate'),
  ( 3, 'Master of Electrical Engineering',              'School of Engineering',            'Postgraduate'),
  ( 4, 'PhD in Aerospace Engineering',                   'School of Engineering',            'Doctorate'),
  ( 5, 'Diploma in Industrial Automation',              'School of Engineering',            'Diploma'),

  -- Business
  ( 6, 'Bachelor of Business Administration',          'School of Business',               'Undergraduate'),
  ( 7, 'Master of Business Administration',            'School of Business',               'Postgraduate'),
  ( 8, 'Master of Finance',                             'School of Business',               'Postgraduate'),
  ( 9, 'Diploma in Supply Chain Management',            'School of Business',               'Diploma'),
  (10, 'PhD in Management',                             'School of Business',               'Doctorate'),

  -- Computer Science
  (11, 'Bachelor of Computer Science',                 'School of Computer Science',        'Undergraduate'),
  (12, 'Master of Computer Science',                   'School of Computer Science',        'Postgraduate'),
  (13, 'PhD in Computer Science',                      'School of Computer Science',        'Doctorate'),
  (14, 'Diploma in Software Development',               'School of Computer Science',        'Diploma'),
  (15, 'Master of Cybersecurity',                       'School of Computer Science',        'Postgraduate'),

  -- Data Science
  (16, 'Bachelor of Data Science',                     'School of Data Science',            'Undergraduate'),
  (17, 'Master of Data Science',                       'School of Data Science',            'Postgraduate'),
  (18, 'Master of Artificial Intelligence',            'School of Data Science',            'Postgraduate'),
  (19, 'PhD in Machine Learning',                      'School of Data Science',            'Doctorate'),
  (20, 'Diploma in Data Analytics',                    'School of Data Science',            'Diploma'),

  -- Healthcare
  (21, 'Bachelor of Nursing',                         'School of Health Sciences',        'Undergraduate'),
  (22, 'Master of Public Health',                      'School of Health Sciences',        'Postgraduate'),
  (23, 'Doctor of Pharmacy',                           'School of Health Sciences',        'Doctorate'),
  (24, 'Diploma in Medical Laboratory Technology',     'School of Health Sciences',        'Diploma'),
  (25, 'Master of Health Administration',              'School of Health Sciences',        'Postgraduate'),

  -- Arts
  (26, 'Bachelor of Fine Arts',                        'School of Arts and Humanities',    'Undergraduate'),
  (27, 'Master of English Literature',                'School of Arts and Humanities',    'Postgraduate'),
  (28, 'PhD in History',                               'School of Arts and Humanities',    'Doctorate'),
  (29, 'Diploma in Creative Writing',                  'School of Arts and Humanities',    'Diploma'),
  (30, 'Bachelor of Music',                            'School of Arts and Humanities',    'Undergraduate'),

  -- Design
  (31, 'Bachelor of Graphic Design',                   'School of Design',                 'Undergraduate'),
  (32, 'Master of UX Design',                          'School of Design',                 'Postgraduate'),
  (33, 'Diploma in Interior Design',                    'School of Design',                 'Diploma'),
  (34, 'Master of Architecture',                       'School of Design',                 'Postgraduate'),
  (35, 'Bachelor of Industrial Design',                'School of Design',                 'Undergraduate'),

  -- Education
  (36, 'Bachelor of Education',                        'School of Education',              'Undergraduate'),
  (37, 'Master of Curriculum and Instruction',         'School of Education',              'Postgraduate'),
  (38, 'PhD in Educational Leadership',                'School of Education',              'Doctorate'),
  (39, 'Diploma in Early Childhood Education',          'School of Education',              'Diploma'),
  (40, 'Master of Special Education',                  'School of Education',              'Postgraduate'),

  -- Law
  (41, 'Juris Doctor',                                 'School of Law',                    'Doctorate'),
  (42, 'Master of Laws (LLM)',                         'School of Law',                    'Postgraduate'),
  (43, 'Bachelor of Legal Studies',                    'School of Law',                    'Undergraduate'),
  (44, 'Diploma in Paralegal Studies',                 'School of Law',                    'Diploma'),
  (45, 'PhD in Law',                                    'School of Law',                    'Doctorate'),

  -- Sciences
  (46, 'Bachelor of Biology',                          'School of Natural Sciences',       'Undergraduate'),
  (47, 'Master of Chemistry',                          'School of Natural Sciences',       'Postgraduate'),
  (48, 'PhD in Physics',                               'School of Natural Sciences',       'Doctorate'),
  (49, 'Diploma in Environmental Science',              'School of Natural Sciences',       'Diploma'),
  (50, 'Master of Biotechnology',                       'School of Natural Sciences',       'Postgraduate');

-- Validation: row count
SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.program;

-- Validation: sample records
SELECT * FROM admissions_mvp.curated.program ORDER BY program_id LIMIT 50;

-- COMMAND ----------

-- Create the campus table if it doesn't already exist
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.campus (
  campus_id    INT,
  campus_name   STRING,
  state         STRING
)
USING DELTA;

-- Clear any existing rows so the insert is idempotent
TRUNCATE TABLE admissions_mvp.curated.campus;

-- Insert 10 realistic, unique Indian university campuses
INSERT INTO admissions_mvp.curated.campus (campus_id, campus_name, state)
VALUES
  ( 1, 'Anna University Campus',              'Tamil Nadu'),
  ( 2, 'IIT Bombay Campus',                   'Maharashtra'),
  ( 3, 'IIM Bangalore Campus',                'Karnataka'),
  ( 4, 'Delhi University North Campus',       'Delhi'),
  ( 5, 'BITS Pilani Campus',                  'Rajasthan'),
  ( 6, 'IIT Kharagpur Campus',                'West Bengal'),
  ( 7, 'University of Hyderabad Campus',     'Telangana'),
  ( 8, 'IIT Kanpur Campus',                   'Uttar Pradesh'),
  ( 9, 'NIT Trichy Campus',                   'Tamil Nadu'),
  (10, 'IIT Madras Campus',                   'Tamil Nadu');

-- Validation: row count
SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.campus;

-- Validation: sample records
SELECT * FROM admissions_mvp.curated.campus ORDER BY campus_id LIMIT 10;

-- COMMAND ----------

-- Create the intake table if it doesn't already exist
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.intake (
  intake_id      INT,
  intake_name    STRING,
  academic_term  STRING,
  academic_year  INT
)
USING DELTA;

-- Clear any existing rows so the insert is idempotent
TRUNCATE TABLE admissions_mvp.curated.intake;

-- Insert 8 realistic, unique admission intakes across the last 2 academic years
INSERT INTO admissions_mvp.curated.intake (intake_id, intake_name, academic_term, academic_year)
VALUES
  (1, 'Spring 2025', 'Spring', 2025),
  (2, 'Summer 2025', 'Summer', 2025),
  (3, 'Fall 2025',   'Fall',   2025),
  (4, 'Winter 2025', 'Winter', 2025),
  (5, 'Spring 2026', 'Spring', 2026),
  (6, 'Summer 2026', 'Summer', 2026),
  (7, 'Fall 2026',   'Fall',   2026),
  (8, 'Winter 2026', 'Winter', 2026);

-- Validation: row count
SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.intake;

-- Validation: sample records
SELECT * FROM admissions_mvp.curated.intake ORDER BY intake_id LIMIT 8;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import col, when, rand, expr
-- MAGIC from pyspark.sql.types import IntegerType, StringType
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 1. Create the geography table (if it doesn't already exist)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC spark.sql("""
-- MAGIC CREATE TABLE IF NOT EXISTS admissions_mvp.curated.geography (
-- MAGIC   geography_id    INT,
-- MAGIC   geography_name  STRING,
-- MAGIC   state           STRING,
-- MAGIC   country         STRING,
-- MAGIC   city            STRING
-- MAGIC )
-- MAGIC USING DELTA;
-- MAGIC """)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 2. Define realistic city pools
-- MAGIC #    ~90 Indian cities (for the 90 % India requirement)
-- MAGIC #    ~10 international cities spread across USA, Canada, UK, Australia,
-- MAGIC #      Singapore, UAE, and Germany (for the 10 % international requirement)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC indian_cities = [
-- MAGIC     # Tamil Nadu
-- MAGIC     ("Chennai", "Tamil Nadu", "India"),
-- MAGIC     ("Coimbatore", "Tamil Nadu", "India"),
-- MAGIC     ("Madurai", "Tamil Nadu", "India"),
-- MAGIC     ("Tiruchirappalli", "Tamil Nadu", "India"),
-- MAGIC     ("Salem", "Tamil Nadu", "India"),
-- MAGIC     ("Tirunelveli", "Tamil Nadu", "India"),
-- MAGIC     ("Vellore", "Tamil Nadu", "India"),
-- MAGIC     ("Thoothukudi", "Tamil Nadu", "India"),
-- MAGIC     ("Erode", "Tamil Nadu", "India"),
-- MAGIC     ("Dindigul", "Tamil Nadu", "India"),
-- MAGIC     # Maharashtra
-- MAGIC     ("Mumbai", "Maharashtra", "India"),
-- MAGIC     ("Pune", "Maharashtra", "India"),
-- MAGIC     ("Nagpur", "Maharashtra", "India"),
-- MAGIC     ("Nashik", "Maharashtra", "India"),
-- MAGIC     ("Aurangabad", "Maharashtra", "India"),
-- MAGIC     ("Thane", "Maharashtra", "India"),
-- MAGIC     ("Navi Mumbai", "Maharashtra", "India"),
-- MAGIC     ("Solapur", "Maharashtra", "India"),
-- MAGIC     ("Amravati", "Maharashtra", "India"),
-- MAGIC     ("Kolhapur", "Maharashtra", "India"),
-- MAGIC     # Karnataka
-- MAGIC     ("Bengaluru", "Karnataka", "India"),
-- MAGIC     ("Mysuru", "Karnataka", "India"),
-- MAGIC     ("Mangaluru", "Karnataka", "India"),
-- MAGIC     ("Hubli", "Karnataka", "India"),
-- MAGIC     ("Belagavi", "Karnataka", "India"),
-- MAGIC     ("Davanagere", "Karnataka", "India"),
-- MAGIC     ("Gulbarga", "Karnataka", "India"),
-- MAGIC     ("Shimoga", "Karnataka", "India"),
-- MAGIC     ("Tumakuru", "Karnataka", "India"),
-- MAGIC     ("Bellary", "Karnataka", "India"),
-- MAGIC     # Delhi
-- MAGIC     ("New Delhi", "Delhi", "India"),
-- MAGIC     ("Dwarka", "Delhi", "India"),
-- MAGIC     ("Rohini", "Delhi", "India"),
-- MAGIC     ("Saket", "Delhi", "India"),
-- MAGIC     ("Karol Bagh", "Delhi", "India"),
-- MAGIC     # Rajasthan
-- MAGIC     ("Jaipur", "Rajasthan", "India"),
-- MAGIC     ("Jodhpur", "Rajasthan", "India"),
-- MAGIC     ("Udaipur", "Rajasthan", "India"),
-- MAGIC     ("Kota", "Rajasthan", "India"),
-- MAGIC     ("Ajmer", "Rajasthan", "India"),
-- MAGIC     ("Bikaner", "Rajasthan", "India"),
-- MAGIC     ("Alwar", "Rajasthan", "India"),
-- MAGIC     ("Bhilwara", "Rajasthan", "India"),
-- MAGIC     # West Bengal
-- MAGIC     ("Kolkata", "West Bengal", "India"),
-- MAGIC     ("Howrah", "West Bengal", "India"),
-- MAGIC     ("Durgapur", "West Bengal", "India"),
-- MAGIC     ("Asansol", "West Bengal", "India"),
-- MAGIC     ("Siliguri", "West Bengal", "India"),
-- MAGIC     ("Kharagpur", "West Bengal", "India"),
-- MAGIC     # Telangana
-- MAGIC     ("Hyderabad", "Telangana", "India"),
-- MAGIC     ("Warangal", "Telangana", "India"),
-- MAGIC     ("Nizamabad", "Telangana", "India"),
-- MAGIC     ("Karimnagar", "Telangana", "India"),
-- MAGIC     ("Khammam", "Telangana", "India"),
-- MAGIC     # Uttar Pradesh
-- MAGIC     ("Lucknow", "Uttar Pradesh", "India"),
-- MAGIC     ("Kanpur", "Uttar Pradesh", "India"),
-- MAGIC     ("Varanasi", "Uttar Pradesh", "India"),
-- MAGIC     ("Agra", "Uttar Pradesh", "India"),
-- MAGIC     ("Meerut", "Uttar Pradesh", "India"),
-- MAGIC     ("Aligarh", "Uttar Pradesh", "India"),
-- MAGIC     ("Ghaziabad", "Uttar Pradesh", "India"),
-- MAGIC     ("Noida", "Uttar Pradesh", "India"),
-- MAGIC     ("Moradabad", "Uttar Pradesh", "India"),
-- MAGIC     ("Bareilly", "Uttar Pradesh", "India"),
-- MAGIC     # Gujarat
-- MAGIC     ("Ahmedabad", "Gujarat", "India"),
-- MAGIC     ("Surat", "Gujarat", "India"),
-- MAGIC     ("Vadodara", "Gujarat", "India"),
-- MAGIC     ("Rajkot", "Gujarat", "India"),
-- MAGIC     ("Bhavnagar", "Gujarat", "India"),
-- MAGIC     ("Gandhinagar", "Gujarat", "India"),
-- MAGIC     # Kerala
-- MAGIC     ("Kochi", "Kerala", "India"),
-- MAGIC     ("Thiruvananthapuram", "Kerala", "India"),
-- MAGIC     ("Kozhikode", "Kerala", "India"),
-- MAGIC     ("Thrissur", "Kerala", "India"),
-- MAGIC     ("Kollam", "Kerala", "India"),
-- MAGIC     # Punjab
-- MAGIC     ("Ludhiana", "Punjab", "India"),
-- MAGIC     ("Amritsar", "Punjab", "India"),
-- MAGIC     ("Jalandhar", "Punjab", "India"),
-- MAGIC     ("Patiala", "Punjab", "India"),
-- MAGIC     ("Mohali", "Punjab", "India"),
-- MAGIC     # Bihar
-- MAGIC     ("Patna", "Bihar", "India"),
-- MAGIC     ("Gaya", "Bihar", "India"),
-- MAGIC     ("Bhagalpur", "Bihar", "India"),
-- MAGIC     ("Muzaffarpur", "Bihar", "India"),
-- MAGIC     # Odisha
-- MAGIC     ("Bhubaneswar", "Odisha", "India"),
-- MAGIC     ("Cuttack", "Odisha", "India"),
-- MAGIC     ("Rourkela", "Odisha", "India"),
-- MAGIC     # Assam
-- MAGIC     ("Guwahati", "Assam", "India"),
-- MAGIC     ("Dibrugarh", "Assam", "India"),
-- MAGIC     # Jharkhand
-- MAGIC     ("Ranchi", "Jharkhand", "India"),
-- MAGIC     ("Jamshedpur", "Jharkhand", "India"),
-- MAGIC     # Madhya Pradesh
-- MAGIC     ("Bhopal", "Madhya Pradesh", "India"),
-- MAGIC     ("Indore", "Madhya Pradesh", "India"),
-- MAGIC     ("Jabalpur", "Madhya Pradesh", "India"),
-- MAGIC     ("Gwalior", "Madhya Pradesh", "India"),
-- MAGIC     # Chhattisgarh
-- MAGIC     ("Raipur", "Chhattisgarh", "India"),
-- MAGIC     ("Bhilai", "Chhattisgarh", "India"),
-- MAGIC     # Goa
-- MAGIC     ("Panaji", "Goa", "India"),
-- MAGIC     ("Margao", "Goa", "India"),
-- MAGIC     # Haryana
-- MAGIC     ("Gurugram", "Haryana", "India"),
-- MAGIC     ("Faridabad", "Haryana", "India"),
-- MAGIC     ("Karnal", "Haryana", "India"),
-- MAGIC     # Jammu & Kashmir
-- MAGIC     ("Srinagar", "Jammu and Kashmir", "India"),
-- MAGIC     ("Jammu", "Jammu and Kashmir", "India"),
-- MAGIC     # Andhra Pradesh
-- MAGIC     ("Visakhapatnam", "Andhra Pradesh", "India"),
-- MAGIC     ("Vijayawada", "Andhra Pradesh", "India"),
-- MAGIC     ("Guntur", "Andhra Pradesh", "India"),
-- MAGIC ]
-- MAGIC
-- MAGIC international_cities = [
-- MAGIC     # USA
-- MAGIC     ("New York", "New York", "USA"),
-- MAGIC     ("San Francisco", "California", "USA"),
-- MAGIC     ("Chicago", "Illinois", "USA"),
-- MAGIC     ("Boston", "Massachusetts", "USA"),
-- MAGIC     # Canada
-- MAGIC     ("Toronto", "Ontario", "Canada"),
-- MAGIC     ("Vancouver", "British Columbia", "Canada"),
-- MAGIC     # UK
-- MAGIC     ("London", "England", "UK"),
-- MAGIC     ("Manchester", "England", "UK"),
-- MAGIC     # Australia
-- MAGIC     ("Sydney", "New South Wales", "Australia"),
-- MAGIC     ("Melbourne", "Victoria", "Australia"),
-- MAGIC     # Singapore
-- MAGIC     ("Singapore", "Singapore", "Singapore"),
-- MAGIC     # UAE
-- MAGIC     ("Dubai", "Dubai", "UAE"),
-- MAGIC     ("Abu Dhabi", "Abu Dhabi", "UAE"),
-- MAGIC     # Germany
-- MAGIC     ("Berlin", "Berlin", "Germany"),
-- MAGIC     ("Munich", "Bavaria", "Germany"),
-- MAGIC ]
-- MAGIC
-- MAGIC print(f"Indian city pool:  {len(indian_cities)} entries")
-- MAGIC print(f"International pool: {len(international_cities)} entries")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 3. Build the full geography list  (exactly 100 unique rows, ~90 / ~10 split)
-- MAGIC #    geography_name  = city name  (unique across the 100 rows)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC num_international = 10                      # 10 %
-- MAGIC num_indian        = 100 - num_international   # 90 %
-- MAGIC
-- MAGIC all_geos = indian_cities[:num_indian] + international_cities[:num_international]
-- MAGIC assert len(all_geos) == 100, f"Expected 100 rows, got {len(all_geos)}"
-- MAGIC
-- MAGIC # Verify uniqueness of city names (geography_name)
-- MAGIC geo_names = [g[0] for g in all_geos]
-- MAGIC assert len(set(geo_names)) == 100, "Duplicate geography_name detected!"
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 4. Generate the DataFrame with spark.range() + rand() for the geography_id
-- MAGIC #    assignment, then join to the city pool.
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC spark.catalog.setCurrentCatalog("admissions_mvp")  # safe default
-- MAGIC
-- MAGIC # Start from spark.range(100) – gives us geography_id 1..100
-- MAGIC ids_df = spark.range(1, 101).toDF("geography_id")
-- MAGIC
-- MAGIC # Add a random ordering column so the city assignment is non-deterministic
-- MAGIC # (simulates the rand() requirement while keeping 1-to-1 mapping)
-- MAGIC ids_df = ids_df.withColumn("rnd", rand(seed=42))
-- MAGIC
-- MAGIC # Build the city pool DataFrame
-- MAGIC city_schema = "city STRING, state STRING, country STRING"
-- MAGIC city_df = spark.createDataFrame(all_geos, city_schema)
-- MAGIC
-- MAGIC # Assign a row_number to the city pool ordered by a random value so that
-- MAGIC # the mapping of geography_id -> city is shuffled each run.
-- MAGIC from pyspark.sql.window import Window
-- MAGIC from pyspark.sql.functions import row_number
-- MAGIC
-- MAGIC city_df = city_df.withColumn("rnd", rand(seed=7))
-- MAGIC city_df = city_df.withColumn("geo_rk", row_number().over(Window.orderBy("rnd")))
-- MAGIC
-- MAGIC # Assign a matching row_number to ids_df ordered by its own random column
-- MAGIC ids_df = ids_df.withColumn("geo_rk", row_number().over(Window.orderBy("rnd")))
-- MAGIC
-- MAGIC # Join on the row_number to get a 1-to-1 shuffled mapping
-- MAGIC geo_df = (
-- MAGIC     ids_df.join(city_df, on="geo_rk", how="inner")
-- MAGIC          .select(
-- MAGIC              col("geography_id").cast(IntegerType()),
-- MAGIC              col("city").alias("geography_name"),
-- MAGIC              col("state"),
-- MAGIC              col("country"),
-- MAGIC              col("city"),
-- MAGIC          )
-- MAGIC          .orderBy("geography_id")
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 5. Write to the Delta table (overwrite for idempotency)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC (geo_df.write
-- MAGIC        .format("delta")
-- MAGIC        .mode("overwrite")
-- MAGIC        .option("overwriteSchema", "true")
-- MAGIC        .saveAsTable("admissions_mvp.curated.geography"))
-- MAGIC
-- MAGIC print("\n✅ Data written to admissions_mvp.curated.geography")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 6. Validation: row count
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC row_count = spark.sql("SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.geography")
-- MAGIC row_count.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 7. Validation: sample records
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC sample_df = spark.sql("SELECT * FROM admissions_mvp.curated.geography ORDER BY geography_id LIMIT 100")
-- MAGIC sample_df.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 8. Validation: geography_id uniqueness
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC dupes_df = spark.sql("""
-- MAGIC     SELECT geography_id, COUNT(*) AS occurrence_count
-- MAGIC     FROM admissions_mvp.curated.geography
-- MAGIC     GROUP BY geography_id
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC
-- MAGIC dupe_count = dupes_df.count()
-- MAGIC if dupe_count == 0:
-- MAGIC     print("\n✅ Validation passed: all 100 geography_id values are unique.")
-- MAGIC else:
-- MAGIC     print(f"\n❌ Validation FAILED: {dupe_count} duplicate geography_id values found.")
-- MAGIC     dupes_df.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 9. Validation: geography_name uniqueness
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC name_dupes = spark.sql("""
-- MAGIC     SELECT geography_name, COUNT(*) AS occurrence_count
-- MAGIC     FROM admissions_mvp.curated.geography
-- MAGIC     GROUP BY geography_name
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC name_dupe_count = name_dupes.count()
-- MAGIC if name_dupe_count == 0:
-- MAGIC     print("✅ Validation passed: all 100 geography_name values are unique.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {name_dupe_count} duplicate geography_name values found.")
-- MAGIC     name_dupes.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 10. Validation: India vs international split
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC country_split = spark.sql("""
-- MAGIC     SELECT country, COUNT(*) AS cnt,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 100, 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.geography
-- MAGIC     GROUP BY country
-- MAGIC     ORDER BY cnt DESC
-- MAGIC """)
-- MAGIC print("\nCountry distribution:")
-- MAGIC country_split.display()

-- COMMAND ----------

-- Create the dim_stage table if it doesn't already exist
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.dim_stage (
  stage_id        INT,
  stage_name      STRING,
  stage_sequence  INT
)
USING DELTA;

-- Clear any existing rows so the insert is idempotent
TRUNCATE TABLE admissions_mvp.curated.dim_stage;

-- Insert 8 admission lifecycle stages in exact order
INSERT INTO admissions_mvp.curated.dim_stage (stage_id, stage_name, stage_sequence)
VALUES
  (1, 'Submitted',       1),
  (2, 'Under Review',     2),
  (3, 'Qualified',        3),
  (4, 'Offer Made',       4),
  (5, 'Offer Accepted',   5),
  (6, 'Enrolled',         6),
  (7, 'Withdrawn',        7),
  (8, 'Rejected',         8);

-- Display all records
SELECT * FROM admissions_mvp.curated.dim_stage ORDER BY stage_sequence;

-- Validation: row count = 8
SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.dim_stage;

-- Validation: no duplicate stage_id
SELECT stage_id, COUNT(*) AS occurrence_count
FROM admissions_mvp.curated.dim_stage
GROUP BY stage_id
HAVING COUNT(*) > 1;

-- Validation: no duplicate stage_name
SELECT stage_name, COUNT(*) AS occurrence_count
FROM admissions_mvp.curated.dim_stage
GROUP BY stage_name
HAVING COUNT(*) > 1;

-- Validation: stage_sequence is ordered correctly (1..8 with no gaps)
SELECT stage_sequence
FROM admissions_mvp.curated.dim_stage
ORDER BY stage_sequence;


-- COMMAND ----------

-- Create the counselor table if it doesn't already exist
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.counselor (
  counselor_id    INT,
  counselor_name  STRING
)
USING DELTA;

-- Clear any existing rows so the insert is idempotent
TRUNCATE TABLE admissions_mvp.curated.counselor;

-- Insert 50 realistic, unique admissions counselors
INSERT INTO admissions_mvp.curated.counselor (counselor_id, counselor_name)
VALUES
  ( 1, 'Aarav Sharma'),
  ( 2, 'Diya Patel'),
  ( 3, 'Vivaan Reddy'),
  ( 4, 'Ananya Iyer'),
  ( 5, 'Arjun Nair'),
  ( 6, 'Ishita Verma'),
  ( 7, 'Kabir Singh'),
  ( 8, 'Saanvi Gupta'),
  ( 9, 'Reyansh Kumar'),
  (10, 'Myra Joshi'),
  (11, 'Aditya Rao'),
  (12, 'Kiara Menon'),
  (13, 'Rohan Desai'),
  (14, 'Pari Chauhan'),
  (15, 'Dhruv Malhotra'),
  (16, 'Aadhya Kulkarni'),
  (17, 'Sai Bhat'),
  (18, 'Riya Agarwal'),
  (19, 'Arnav Chopra'),
  (20, 'Navya Pillai'),
  (21, 'Atharv Banerjee'),
  (22, 'Aanya Saxena'),
  (23, 'Virat Trivedi'),
  (24, 'Ira Krishnan'),
  (25, 'Shaurya Mehta'),
  (26, 'Anika Bose'),
  (27, 'Karan Bhattacharya'),
  (28, 'Khushi Nanda'),
  (29, 'Pranav Mukherjee'),
  (30, 'Sara Kapoor'),
  (31, 'Rudra Pandey'),
  (32, 'Ishani Dutta'),
  (33, 'Yuvan Chawla'),
  (34, 'Mahika Raghavan'),
  (35, 'Devang Shah'),
  (36, 'Tara Subramaniam'),
  (37, 'Nikhil Hegde'),
  (38, 'Vidya Raman'),
  (39, 'Ojas Godbole'),
  (40, 'Suhani Pai'),
  (41, 'Tejas Bhatia'),
  (42, 'Nitya Sengupta'),
  (43, 'Rishi Malhotra'),
  (44, 'Arya Kothari'),
  (45, 'Aditya Venkatesh'),
  (46, 'Zara Mathur'),
  (47, 'Kiaan Sehgal'),
  (48, 'Pihu Sinha'),
  (49, 'Vihaan Dube'),
  (50, 'Riya Ghosh');

-- Validation: row count
SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.counselor;

-- Validation: sample records
SELECT * FROM admissions_mvp.curated.counselor ORDER BY counselor_id LIMIT 50;

-- Validation: no duplicate counselor_id
SELECT counselor_id, COUNT(*) AS occurrence_count
FROM admissions_mvp.curated.counselor
GROUP BY counselor_id
HAVING COUNT(*) > 1;

-- Validation: no duplicate counselor_name
SELECT counselor_name, COUNT(*) AS occurrence_count
FROM admissions_mvp.curated.counselor
GROUP BY counselor_name
HAVING COUNT(*) > 1;

-- Validation: no null values in either column
SELECT COUNT(*) AS null_counselor_id
FROM admissions_mvp.curated.counselor
WHERE counselor_id IS NULL;

SELECT COUNT(*) AS null_counselor_name
FROM admissions_mvp.curated.counselor
WHERE counselor_name IS NULL;


-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import (
-- MAGIC     col, concat, lit, when, rand, expr, floor, date_add, to_date, countDistinct,
-- MAGIC     sha1, regexp_replace, lower, initcap, format_string
-- MAGIC )
-- MAGIC from pyspark.sql.types import IntegerType, StringType, DateType
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 1. Create the applicant Delta table (if it doesn't already exist)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC spark.sql("""
-- MAGIC CREATE TABLE IF NOT EXISTS admissions_mvp.curated.applicant (
-- MAGIC   applicant_id   INT,
-- MAGIC   first_name     STRING,
-- MAGIC   last_name      STRING,
-- MAGIC   gender         STRING,
-- MAGIC   email          STRING,
-- MAGIC   phone          STRING,
-- MAGIC   geography_id   INT,
-- MAGIC   created_date   DATE
-- MAGIC )
-- MAGIC USING DELTA;
-- MAGIC """)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 2. Small realistic name pools (avoid hardcoding large datasets)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC first_names_male = [
-- MAGIC     'Aarav', 'Vivaan', 'Arjun', 'Kabir', 'Reyansh', 'Aditya', 'Rohan', 'Dhruv',
-- MAGIC     'Sai', 'Arnav', 'Atharv', 'Virat', 'Shaurya', 'Karan', 'Pranav', 'Rudra',
-- MAGIC     'Yuvan', 'Nikhil', 'Ojas', 'Tejas', 'Rishi', 'Kiaan', 'Vihaan', 'Devang',
-- MAGIC     'James', 'Michael', 'David', 'John', 'Robert', 'Daniel', 'Thomas', 'Christopher',
-- MAGIC ]
-- MAGIC
-- MAGIC first_names_female = [
-- MAGIC     'Diya', 'Ananya', 'Ishita', 'Saanvi', 'Myra', 'Kiara', 'Pari', 'Aadhya',
-- MAGIC     'Riya', 'Navya', 'Aanya', 'Ira', 'Anika', 'Khushi', 'Sara', 'Mahika',
-- MAGIC     'Tara', 'Vidya', 'Suhani', 'Nitya', 'Arya', 'Zara', 'Pihu', 'Riya',
-- MAGIC     'Emily', 'Sarah', 'Jessica', 'Jennifer', 'Lisa', 'Emma', 'Olivia', 'Sophia',
-- MAGIC ]
-- MAGIC
-- MAGIC first_names_other = [
-- MAGIC     'Aria', 'Riley', 'Jordan', 'Taylor', 'Casey', 'Morgan', 'Avery', 'Quinn',
-- MAGIC ]
-- MAGIC
-- MAGIC last_names = [
-- MAGIC     'Sharma', 'Patel', 'Reddy', 'Iyer', 'Nair', 'Verma', 'Singh', 'Gupta',
-- MAGIC     'Kumar', 'Joshi', 'Rao', 'Menon', 'Desai', 'Chauhan', 'Malhotra', 'Kulkarni',
-- MAGIC     'Bhat', 'Agarwal', 'Chopra', 'Pillai', 'Banerjee', 'Saxena', 'Trivedi',
-- MAGIC     'Krishnan', 'Mehta', 'Bose', 'Bhattacharya', 'Nanda', 'Mukherjee', 'Kapoor',
-- MAGIC     'Pandey', 'Dutta', 'Chawla', 'Raghavan', 'Shah', 'Subramaniam', 'Hegde',
-- MAGIC     'Raman', 'Godbole', 'Pai', 'Bhatia', 'Sengupta', 'Kothari', 'Venkatesh',
-- MAGIC     'Mathur', 'Sehgal', 'Sinha', 'Dube', 'Ghosh',
-- MAGIC     'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Taylor', 'Anderson',
-- MAGIC     'Thomas', 'Martin', 'Lee', 'Clark', 'Lewis', 'Walker', 'Hall', 'Allen',
-- MAGIC ]
-- MAGIC
-- MAGIC print(f"Male first names:   {len(first_names_male)}")
-- MAGIC print(f"Female first names: {len(first_names_female)}")
-- MAGIC print(f"Other first names:  {len(first_names_other)}")
-- MAGIC print(f"Last names:         {len(last_names)}")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 3. Generate 1,000 applicant records using spark.range() + scalable UDF-free ops
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC TOTAL_APPLICANTS = 1000
-- MAGIC
-- MAGIC # Base: applicant_id 1..1000
-- MAGIC df = spark.range(1, TOTAL_APPLICANTS + 1).toDF("applicant_id")
-- MAGIC
-- MAGIC # --- Gender assignment (48 % Female, 47 % Male, 5 % Other) ---
-- MAGIC df = df.withColumn(
-- MAGIC     "gender",
-- MAGIC     when(col("applicant_id") % 100 < 48, lit("Female"))
-- MAGIC     .when(col("applicant_id") % 100 < 95, lit("Male"))
-- MAGIC     .otherwise(lit("Other"))
-- MAGIC )
-- MAGIC
-- MAGIC # --- Name generation: pick from pools using a hash-based index ---
-- MAGIC # Use rand(seed=10) to create a stable shuffle-like index for first name
-- MAGIC # and a different seed for last name so the combinations are realistic and varied.
-- MAGIC # We use expr() with element_at on an array built from the pools.
-- MAGIC all_first_male = first_names_male + first_names_other  # Other names also used for Other gender
-- MAGIC all_first_female = first_names_female + first_names_other
-- MAGIC
-- MAGIC # Build arrays in SQL-friendly way
-- MAGIC male_array_str = str(all_first_male)
-- MAGIC female_array_str = str(all_first_female)
-- MAGIC last_array_str = str(last_names)
-- MAGIC
-- MAGIC df = df.withColumn(
-- MAGIC     "first_name",
-- MAGIC     when(
-- MAGIC         col("gender") == "Male",
-- MAGIC         expr(f"element_at(array({', '.join([repr(n) for n in all_first_male])}), int(floor(rand(10) * {len(all_first_male)}) + 1))")
-- MAGIC     ).when(
-- MAGIC         col("gender") == "Female",
-- MAGIC         expr(f"element_at(array({', '.join([repr(n) for n in all_first_female])}), int(floor(rand(11) * {len(all_first_female)}) + 1))")
-- MAGIC     ).otherwise(
-- MAGIC         expr(f"element_at(array({', '.join([repr(n) for n in first_names_other])}), int(floor(rand(12) * {len(first_names_other)}) + 1))")
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC df = df.withColumn(
-- MAGIC     "last_name",
-- MAGIC     expr(f"element_at(array({', '.join([repr(n) for n in last_names])}), int(floor(rand(13) * {len(last_names)}) + 1))")
-- MAGIC )
-- MAGIC
-- MAGIC # --- Email: unique, built from name + applicant_id to guarantee uniqueness ---
-- MAGIC df = df.withColumn(
-- MAGIC     "email",
-- MAGIC     lower(concat(
-- MAGIC         regexp_replace(lower(col("first_name")), "[^a-z]", ""),
-- MAGIC         lit("."),
-- MAGIC         regexp_replace(lower(col("last_name")), "[^a-z]", ""),
-- MAGIC         lit("_"),
-- MAGIC         col("applicant_id"),
-- MAGIC         lit("@gmail.com")
-- MAGIC     ))
-- MAGIC )
-- MAGIC
-- MAGIC # --- Phone: realistic Indian / international-style 10-digit numbers ---
-- MAGIC df = df.withColumn(
-- MAGIC     "phone",
-- MAGIC     concat(
-- MAGIC         lit("+91 "),
-- MAGIC         format_string("%02d", expr(f"int(floor(rand(14) * 89) + 10)")),  # first 2 digits 10-99
-- MAGIC         format_string("%03d", expr(f"int(floor(rand(15) * 900) + 100)")), # next 3 digits 100-999
-- MAGIC         format_string("%05d", expr(f"int(floor(rand(16) * 90000) + 10000)"))  # last 5 digits 10000-99999
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # \\--- geography_id: random reference to valid geography records (1..100) ---
-- MAGIC # We read the max geography_id from the table to be safe
-- MAGIC geo_max = spark.sql("SELECT MAX(geography_id) AS mx FROM admissions_mvp.curated.geography").collect()[0]["mx"]
-- MAGIC geo_min = spark.sql("SELECT MIN(geography_id) AS mn FROM admissions_mvp.curated.geography").collect()[0]["mn"]
-- MAGIC print(f"\nGeography ID range: {geo_min} .. {geo_max}")
-- MAGIC
-- MAGIC df = df.withColumn(
-- MAGIC     "geography_id",
-- MAGIC     expr(f"int(floor(rand(17) * ({geo_max} - {geo_min} + 1)) + {geo_min})")
-- MAGIC )
-- MAGIC
-- MAGIC # --- created_date: distributed across last 2 academic years (approx 730 days) ---
-- MAGIC # Start date = 2024-01-01 (covers Spring 2024 through Winter 2025 / early 2026)
-- MAGIC start_date = to_date(lit("2024-01-01"))
-- MAGIC df = df.withColumn(
-- MAGIC     "created_date",
-- MAGIC     date_add(start_date, expr(f"int(floor(rand(18) * 730))"))
-- MAGIC )
-- MAGIC
-- MAGIC # Cast types for safety
-- MAGIC df = df.select(
-- MAGIC     col("applicant_id").cast(IntegerType()),
-- MAGIC     initcap(col("first_name")).alias("first_name"),
-- MAGIC     initcap(col("last_name")).alias("last_name"),
-- MAGIC     col("gender").cast(StringType()),
-- MAGIC     col("email").cast(StringType()),
-- MAGIC     col("phone").cast(StringType()),
-- MAGIC     col("geography_id").cast(IntegerType()),
-- MAGIC     col("created_date").cast(DateType()),
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 4. Write to the Delta table (overwrite for idempotency)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC (df.write
-- MAGIC    .format("delta")
-- MAGIC    .mode("overwrite")
-- MAGIC    .option("overwriteSchema", "true")
-- MAGIC    .saveAsTable("admissions_mvp.curated.applicant"))
-- MAGIC
-- MAGIC print("\n✅ Data written to admissions_mvp.curated.applicant")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 5. Validation: row count = 1,000
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC row_count = spark.sql("SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.applicant")
-- MAGIC row_count.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 6. Validation: applicant_id unique
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC dup_id = spark.sql("""
-- MAGIC     SELECT applicant_id, COUNT(*) AS occurrence_count
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC     GROUP BY applicant_id
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC dup_id_cnt = dup_id.count()
-- MAGIC if dup_id_cnt == 0:
-- MAGIC     print("✅ Validation passed: applicant_id is unique.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {dup_id_cnt} duplicate applicant_id values found.")
-- MAGIC     dup_id.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 7. Validation: email unique
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC dup_email = spark.sql("""
-- MAGIC     SELECT email, COUNT(*) AS occurrence_count
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC     GROUP BY email
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC dup_email_cnt = dup_email.count()
-- MAGIC if dup_email_cnt == 0:
-- MAGIC     print("✅ Validation passed: email is unique.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {dup_email_cnt} duplicate email values found.")
-- MAGIC     dup_email.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 8. Validation: geography_id referential integrity
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_geo = spark.sql("""
-- MAGIC     SELECT a.geography_id
-- MAGIC     FROM admissions_mvp.curated.applicant a
-- MAGIC     LEFT JOIN admissions_mvp.curated.geography g
-- MAGIC       ON a.geography_id = g.geography_id
-- MAGIC     WHERE g.geography_id IS NULL
-- MAGIC """)
-- MAGIC orphan_cnt = orphan_geo.count()
-- MAGIC if orphan_cnt == 0:
-- MAGIC     print("✅ Validation passed: all geography_id values reference valid geography records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_cnt} orphan geography_id values found.")
-- MAGIC     orphan_geo.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 9. Validation: no null values in mandatory columns
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC null_check = spark.sql("""
-- MAGIC     SELECT
-- MAGIC       SUM(CASE WHEN applicant_id  IS NULL THEN 1 ELSE 0 END) AS null_applicant_id,
-- MAGIC       SUM(CASE WHEN first_name     IS NULL THEN 1 ELSE 0 END) AS null_first_name,
-- MAGIC       SUM(CASE WHEN last_name      IS NULL THEN 1 ELSE 0 END) AS null_last_name,
-- MAGIC       SUM(CASE WHEN gender         IS NULL THEN 1 ELSE 0 END) AS null_gender,
-- MAGIC       SUM(CASE WHEN email          IS NULL THEN 1 ELSE 0 END) AS null_email,
-- MAGIC       SUM(CASE WHEN phone          IS NULL THEN 1 ELSE 0 END) AS null_phone,
-- MAGIC       SUM(CASE WHEN geography_id   IS NULL THEN 1 ELSE 0 END) AS null_geography_id,
-- MAGIC       SUM(CASE WHEN created_date   IS NULL THEN 1 ELSE 0 END) AS null_created_date
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC """)
-- MAGIC null_check.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 10. Display: sample 20 records
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📋 Sample 20 records:")
-- MAGIC sample_df = spark.sql("""
-- MAGIC     SELECT applicant_id, first_name, last_name, gender, email, phone, geography_id, created_date
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC     ORDER BY applicant_id
-- MAGIC     LIMIT 20
-- MAGIC """)
-- MAGIC sample_df.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 11. Display: geography distribution summary
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n🗺️  Geography distribution summary:")
-- MAGIC geo_dist = spark.sql("""
-- MAGIC     SELECT
-- MAGIC       g.country,
-- MAGIC       g.state,
-- MAGIC       COUNT(*)               AS applicant_count,
-- MAGIC       ROUND(COUNT(*) * 100.0 / 1000, 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.applicant a
-- MAGIC     JOIN admissions_mvp.curated.geography g
-- MAGIC       ON a.geography_id = g.geography_id
-- MAGIC     GROUP BY g.country, g.state
-- MAGIC     ORDER BY applicant_count DESC
-- MAGIC """)
-- MAGIC geo_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 12. Display: gender distribution (analytics-friendly check)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n👤 Gender distribution:")
-- MAGIC gender_dist = spark.sql("""
-- MAGIC     SELECT gender, COUNT(*) AS cnt, ROUND(COUNT(*) * 100.0 / 1000, 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC     GROUP BY gender
-- MAGIC     ORDER BY cnt DESC
-- MAGIC """)
-- MAGIC gender_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 13. Display: created_date distribution by year-month (funnel analytics ready)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📅 Created date distribution by year-month:")
-- MAGIC date_dist = spark.sql("""
-- MAGIC     SELECT
-- MAGIC       date_format(created_date, 'yyyy-MM') AS year_month,
-- MAGIC       COUNT(*) AS applicant_count
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC     GROUP BY date_format(created_date, 'yyyy-MM')
-- MAGIC     ORDER BY year_month
-- MAGIC """)
-- MAGIC date_dist.display()

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import (
-- MAGIC     col, lit, when, rand, expr, floor, current_date, date_add, date_sub,
-- MAGIC     count, countDistinct, row_number
-- MAGIC )
-- MAGIC from pyspark.sql.window import Window
-- MAGIC from pyspark.sql.types import IntegerType, StringType, DateType
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 1. Create the application Delta table (if it doesn't already exist)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC spark.sql("""
-- MAGIC CREATE TABLE IF NOT EXISTS admissions_mvp.curated.application (
-- MAGIC   application_id   INT,
-- MAGIC   applicant_id     INT,
-- MAGIC   program_id       INT,
-- MAGIC   campus_id        INT,
-- MAGIC   intake_id        INT,
-- MAGIC   application_date DATE,
-- MAGIC   current_status   STRING
-- MAGIC )
-- MAGIC USING DELTA;
-- MAGIC """)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 2. Collect valid reference IDs from dimension / source tables
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC program_ids = [r.program_id for r in spark.sql(
-- MAGIC     "SELECT program_id FROM admissions_mvp.curated.program ORDER BY program_id"
-- MAGIC ).collect()]
-- MAGIC campus_ids  = [r.campus_id  for r in spark.sql(
-- MAGIC     "SELECT campus_id  FROM admissions_mvp.curated.campus  ORDER BY campus_id"
-- MAGIC ).collect()]
-- MAGIC intake_ids  = [r.intake_id  for r in spark.sql(
-- MAGIC     "SELECT intake_id  FROM admissions_mvp.curated.intake  ORDER BY intake_id"
-- MAGIC ).collect()]
-- MAGIC
-- MAGIC applicant_min = spark.sql(
-- MAGIC     "SELECT MIN(applicant_id) AS mn FROM admissions_mvp.curated.applicant"
-- MAGIC ).collect()[0]["mn"]
-- MAGIC applicant_max = spark.sql(
-- MAGIC     "SELECT MAX(applicant_id) AS mx FROM admissions_mvp.curated.applicant"
-- MAGIC ).collect()[0]["mx"]
-- MAGIC
-- MAGIC print(f"Programs:  {len(program_ids)}  IDs: {program_ids[:5]} ... {program_ids[-3:]}")
-- MAGIC print(f"Campuses:  {len(campus_ids)}  IDs: {campus_ids}")
-- MAGIC print(f"Intakes:   {len(intake_ids)}  IDs: {intake_ids}")
-- MAGIC print(f"Applicant ID range: {applicant_min} .. {applicant_max}")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 3. Build weighted program tiers (high-demand / medium / niche)
-- MAGIC #    First 20 % of programs → high-demand  (40 % of applications)
-- MAGIC #    Next  40 % of programs → medium       (35 % of applications)
-- MAGIC #    Remaining 40 %          → niche        (25 % of applications)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC n_prog   = len(program_ids)
-- MAGIC n_high   = max(1, n_prog // 5)                    # ~20 % of programs
-- MAGIC n_med    = max(1, (n_prog * 2) // 5)              # ~40 % of programs
-- MAGIC n_niche  = n_prog - n_high - n_med                 # remaining ~40 %
-- MAGIC
-- MAGIC high_ids  = program_ids[:n_high]
-- MAGIC med_ids   = program_ids[n_high : n_high + n_med]
-- MAGIC niche_ids = program_ids[n_high + n_med :]
-- MAGIC
-- MAGIC print(f"\nProgram tiers → high-demand: {len(high_ids)}, medium: {len(med_ids)}, niche: {len(niche_ids)}")
-- MAGIC
-- MAGIC # Build comma-separated ID strings for element_at()
-- MAGIC high_str   = ', '.join(str(x) for x in high_ids)
-- MAGIC med_str    = ', '.join(str(x) for x in med_ids)
-- MAGIC niche_str  = ', '.join(str(x) for x in niche_ids)
-- MAGIC campus_str = ', '.join(str(x) for x in campus_ids)
-- MAGIC intake_str = ', '.join(str(x) for x in intake_ids)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 4. Generate 5 000 application records
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC TOTAL_APPS = 5000
-- MAGIC
-- MAGIC df = spark.range(1, TOTAL_APPS + 1).toDF("application_id")
-- MAGIC
-- MAGIC # --- applicant_id: random reference (allows multiple apps per applicant) ---
-- MAGIC df = df.withColumn(
-- MAGIC     "applicant_id",
-- MAGIC     expr(f"int(floor(rand(50) * ({applicant_max} - {applicant_min} + 1)) + {applicant_min})")
-- MAGIC )
-- MAGIC
-- MAGIC # --- program_id: weighted toward high-demand programs ---
-- MAGIC df = df.withColumn("r_prog", rand(44))
-- MAGIC df = df.withColumn(
-- MAGIC     "program_id",
-- MAGIC     when(col("r_prog") < 0.40,
-- MAGIC          expr(f"element_at(array({high_str}), int(floor(rand(45) * {len(high_ids)}) + 1))"))
-- MAGIC     .when(col("r_prog") < 0.75,
-- MAGIC          expr(f"element_at(array({med_str}), int(floor(rand(46) * {len(med_ids)}) + 1))"))
-- MAGIC     .otherwise(
-- MAGIC          expr(f"element_at(array({niche_str}), int(floor(rand(47) * {len(niche_ids)}) + 1))"))
-- MAGIC )
-- MAGIC
-- MAGIC # --- campus_id: uniform random across all campuses ---
-- MAGIC df = df.withColumn(
-- MAGIC     "campus_id",
-- MAGIC     expr(f"element_at(array({campus_str}), int(floor(rand(48) * {len(campus_ids)}) + 1))")
-- MAGIC )
-- MAGIC
-- MAGIC # --- intake_id: uniform random across all intakes ---
-- MAGIC df = df.withColumn(
-- MAGIC     "intake_id",
-- MAGIC     expr(f"element_at(array({intake_str}), int(floor(rand(49) * {len(intake_ids)}) + 1))")
-- MAGIC )
-- MAGIC
-- MAGIC # --- application_date: spread across last 2 academic years (~730 days) ---
-- MAGIC df = df.withColumn(
-- MAGIC     "application_date",
-- MAGIC     expr(f"date_add(date_sub(current_date(), 730), int(floor(rand(51) * 730)))")
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 5. Assign current_status using the admissions funnel
-- MAGIC #
-- MAGIC #    Target funnel (cumulative, of 5 000 total):
-- MAGIC #      Submitted       → 100 %  = 5000
-- MAGIC #      Under Review    →  85 %  = 4250
-- MAGIC #      Qualified       →  68 %  = 3400
-- MAGIC #      Offer Made      →  44 %  = 2200
-- MAGIC #      Offer Accepted  →  24 %  = 1200
-- MAGIC #      Enrolled        →  13 %  =  650
-- MAGIC #
-- MAGIC #    Drop-offs at each stage become Withdrawn or Rejected.
-- MAGIC #    Final status distribution (exact counts via row_number bucketing):
-- MAGIC #      Enrolled         650   (13.0 %)
-- MAGIC #      Offer Accepted   300   ( 6.0 %)
-- MAGIC #      Withdrawn        250   ( 5.0 %)   ← dropped at Offer-Accepted stage
-- MAGIC #      Offer Made       400   ( 8.0 %)
-- MAGIC #      Withdrawn        350   ( 7.0 %)   ← dropped at Offer-Made stage
-- MAGIC #      Rejected         250   ( 5.0 %)   ← dropped at Offer-Made stage
-- MAGIC #      Qualified        500   (10.0 %)
-- MAGIC #      Rejected         400   ( 8.0 %)   ← dropped at Qualified stage
-- MAGIC #      Withdrawn        300   ( 6.0 %)   ← dropped at Qualified stage
-- MAGIC #      Under Review     350   ( 7.0 %)
-- MAGIC #      Rejected         500   (10.0 %)   ← dropped at Under-Review stage
-- MAGIC #      Submitted        400   ( 8.0 %)
-- MAGIC #      Withdrawn        350   ( 7.0 %)   ← dropped at Submitted stage
-- MAGIC #      ─────────────────────────────────
-- MAGIC #      Total           5000  (100.0 %)
-- MAGIC #
-- MAGIC #    Withdrawn total = 1 250 (25.0 %)
-- MAGIC #    Rejected  total = 1 150 (23.0 %)
-- MAGIC #
-- MAGIC #    NOTE: The full funnel (which stage each Withdrawn/Rejected app reached)
-- MAGIC #    will be reconstructed when application_stage_event records are generated
-- MAGIC #    downstream.  The current_status column captures only the final state.
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # Randomise row order, then assign exact-count buckets via row_number
-- MAGIC df = df.withColumn("_r_sort", rand(42))
-- MAGIC w  = Window.orderBy("_r_sort")
-- MAGIC df = df.withColumn("_rn", row_number().over(w))
-- MAGIC
-- MAGIC df = df.withColumn(
-- MAGIC     "current_status",
-- MAGIC     when(col("_rn") <=  650, lit("Enrolled"))         #   1 –  650  → 13.0 %
-- MAGIC     .when(col("_rn") <=  950, lit("Offer Accepted"))   #  651 –  950  →  6.0 %
-- MAGIC     .when(col("_rn") <= 1200, lit("Withdrawn"))        #  951 – 1200  →  5.0 %
-- MAGIC     .when(col("_rn") <= 1600, lit("Offer Made"))       # 1201 – 1600  →  8.0 %
-- MAGIC     .when(col("_rn") <= 1950, lit("Withdrawn"))        # 1601 – 1950  →  7.0 %
-- MAGIC     .when(col("_rn") <= 2200, lit("Rejected"))         # 1951 – 2200  →  5.0 %
-- MAGIC     .when(col("_rn") <= 2700, lit("Qualified"))        # 2201 – 2700  → 10.0 %
-- MAGIC     .when(col("_rn") <= 3100, lit("Rejected"))         # 2701 – 3100  →  8.0 %
-- MAGIC     .when(col("_rn") <= 3400, lit("Withdrawn"))        # 3101 – 3400  →  6.0 %
-- MAGIC     .when(col("_rn") <= 3750, lit("Under Review"))     # 3401 – 3750  →  7.0 %
-- MAGIC     .when(col("_rn") <= 4250, lit("Rejected"))         # 3751 – 4250  → 10.0 %
-- MAGIC     .when(col("_rn") <= 4650, lit("Submitted"))        # 4251 – 4650  →  8.0 %
-- MAGIC     .otherwise(lit("Withdrawn"))                       # 4651 – 5000  →  7.0 %
-- MAGIC )
-- MAGIC
-- MAGIC # Clean up helper columns
-- MAGIC df = df.drop("_r_sort", "_rn", "r_prog")
-- MAGIC
-- MAGIC # Cast for safety
-- MAGIC df = df.select(
-- MAGIC     col("application_id").cast(IntegerType()),
-- MAGIC     col("applicant_id").cast(IntegerType()),
-- MAGIC     col("program_id").cast(IntegerType()),
-- MAGIC     col("campus_id").cast(IntegerType()),
-- MAGIC     col("intake_id").cast(IntegerType()),
-- MAGIC     col("application_date").cast(DateType()),
-- MAGIC     col("current_status").cast(StringType()),
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 6. Write to the Delta table (overwrite for idempotency)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC (df.write
-- MAGIC    .format("delta")
-- MAGIC    .mode("overwrite")
-- MAGIC    .option("overwriteSchema", "true")
-- MAGIC    .saveAsTable("admissions_mvp.curated.application"))
-- MAGIC
-- MAGIC print("\n✅ Data written to admissions_mvp.curated.application")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 7. Validation: row count = 5 000
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC row_count = spark.sql("SELECT COUNT(*) AS total_rows FROM admissions_mvp.curated.application")
-- MAGIC row_count.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 8. Validation: application_id unique
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC dup_id = spark.sql("""
-- MAGIC     SELECT application_id, COUNT(*) AS occurrence_count
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY application_id
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC dup_id_cnt = dup_id.count()
-- MAGIC if dup_id_cnt == 0:
-- MAGIC     print("✅ Validation passed: application_id is unique.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {dup_id_cnt} duplicate application_id values found.")
-- MAGIC     dup_id.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 9. Validation: FK — applicant_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_applicant = spark.sql("""
-- MAGIC     SELECT a.application_id, a.applicant_id
-- MAGIC     FROM admissions_mvp.curated.application a
-- MAGIC     LEFT JOIN admissions_mvp.curated.applicant ap
-- MAGIC       ON a.applicant_id = ap.applicant_id
-- MAGIC     WHERE ap.applicant_id IS NULL
-- MAGIC """)
-- MAGIC orphan_ap_cnt = orphan_applicant.count()
-- MAGIC if orphan_ap_cnt == 0:
-- MAGIC     print("✅ Validation passed: all applicant_id values reference valid applicant records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_ap_cnt} orphan applicant_id values found.")
-- MAGIC     orphan_applicant.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 10. Validation: FK — program_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_program = spark.sql("""
-- MAGIC     SELECT a.application_id, a.program_id
-- MAGIC     FROM admissions_mvp.curated.application a
-- MAGIC     LEFT JOIN admissions_mvp.curated.program p
-- MAGIC       ON a.program_id = p.program_id
-- MAGIC     WHERE p.program_id IS NULL
-- MAGIC """)
-- MAGIC orphan_prog_cnt = orphan_program.count()
-- MAGIC if orphan_prog_cnt == 0:
-- MAGIC     print("✅ Validation passed: all program_id values reference valid program records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_prog_cnt} orphan program_id values found.")
-- MAGIC     orphan_program.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 11. Validation: FK — campus_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_campus = spark.sql("""
-- MAGIC     SELECT a.application_id, a.campus_id
-- MAGIC     FROM admissions_mvp.curated.application a
-- MAGIC     LEFT JOIN admissions_mvp.curated.campus c
-- MAGIC       ON a.campus_id = c.campus_id
-- MAGIC     WHERE c.campus_id IS NULL
-- MAGIC """)
-- MAGIC orphan_camp_cnt = orphan_campus.count()
-- MAGIC if orphan_camp_cnt == 0:
-- MAGIC     print("✅ Validation passed: all campus_id values reference valid campus records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_camp_cnt} orphan campus_id values found.")
-- MAGIC     orphan_campus.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 12. Validation: FK — intake_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_intake = spark.sql("""
-- MAGIC     SELECT a.application_id, a.intake_id
-- MAGIC     FROM admissions_mvp.curated.application a
-- MAGIC     LEFT JOIN admissions_mvp.curated.intake i
-- MAGIC       ON a.intake_id = i.intake_id
-- MAGIC     WHERE i.intake_id IS NULL
-- MAGIC """)
-- MAGIC orphan_intake_cnt = orphan_intake.count()
-- MAGIC if orphan_intake_cnt == 0:
-- MAGIC     print("✅ Validation passed: all intake_id values reference valid intake records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_intake_cnt} orphan intake_id values found.")
-- MAGIC     orphan_intake.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 13. Validation: no null values in required columns
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC null_check = spark.sql("""
-- MAGIC     SELECT
-- MAGIC       SUM(CASE WHEN application_id   IS NULL THEN 1 ELSE 0 END) AS null_application_id,
-- MAGIC       SUM(CASE WHEN applicant_id     IS NULL THEN 1 ELSE 0 END) AS null_applicant_id,
-- MAGIC       SUM(CASE WHEN program_id       IS NULL THEN 1 ELSE 0 END) AS null_program_id,
-- MAGIC       SUM(CASE WHEN campus_id        IS NULL THEN 1 ELSE 0 END) AS null_campus_id,
-- MAGIC       SUM(CASE WHEN intake_id        IS NULL THEN 1 ELSE 0 END) AS null_intake_id,
-- MAGIC       SUM(CASE WHEN application_date IS NULL THEN 1 ELSE 0 END) AS null_application_date,
-- MAGIC       SUM(CASE WHEN current_status   IS NULL THEN 1 ELSE 0 END) AS null_current_status
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC """)
-- MAGIC null_check.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 14. Validation: applicants with multiple applications
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC multi_app = spark.sql("""
-- MAGIC     SELECT applicant_id, COUNT(*) AS application_count
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY applicant_id
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC     ORDER BY application_count DESC
-- MAGIC """)
-- MAGIC multi_app_cnt  = multi_app.count()
-- MAGIC total_applicants = spark.sql(
-- MAGIC     "SELECT COUNT(DISTINCT applicant_id) AS cnt FROM admissions_mvp.curated.application"
-- MAGIC ).collect()[0]["cnt"]
-- MAGIC print(f"\n📋 Applicants with multiple applications: {multi_app_cnt} out of {total_applicants} unique applicants")
-- MAGIC multi_app.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 15. Distribution: current_status
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Distribution by current_status:")
-- MAGIC status_dist = spark.sql("""
-- MAGIC     SELECT current_status,
-- MAGIC            COUNT(*)                       AS application_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 5000, 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY current_status
-- MAGIC     ORDER BY
-- MAGIC       CASE current_status
-- MAGIC         WHEN 'Submitted'       THEN 1
-- MAGIC         WHEN 'Under Review'    THEN 2
-- MAGIC         WHEN 'Qualified'       THEN 3
-- MAGIC         WHEN 'Offer Made'      THEN 4
-- MAGIC         WHEN 'Offer Accepted'  THEN 5
-- MAGIC         WHEN 'Enrolled'        THEN 6
-- MAGIC         WHEN 'Withdrawn'       THEN 7
-- MAGIC         WHEN 'Rejected'        THEN 8
-- MAGIC       END
-- MAGIC """)
-- MAGIC status_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 16. Distribution: program_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Distribution by program_id:")
-- MAGIC program_dist = spark.sql("""
-- MAGIC     SELECT program_id,
-- MAGIC            COUNT(*)                           AS application_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 5000, 1)  AS pct
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY program_id
-- MAGIC     ORDER BY application_count DESC
-- MAGIC """)
-- MAGIC program_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 17. Distribution: campus_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Distribution by campus_id:")
-- MAGIC campus_dist = spark.sql("""
-- MAGIC     SELECT campus_id,
-- MAGIC            COUNT(*)                           AS application_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 5000, 1)  AS pct
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY campus_id
-- MAGIC     ORDER BY campus_id
-- MAGIC """)
-- MAGIC campus_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 18. Distribution: intake_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Distribution by intake_id:")
-- MAGIC intake_dist = spark.sql("""
-- MAGIC     SELECT intake_id,
-- MAGIC            COUNT(*)                           AS application_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 5000, 1)  AS pct
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     GROUP BY intake_id
-- MAGIC     ORDER BY intake_id
-- MAGIC """)
-- MAGIC intake_dist.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 19. Funnel summary (positive-path stages only)
-- MAGIC #     Full funnel validation (including Withdrawn/Rejected drop-off stages)
-- MAGIC #     will be performed when application_stage_event records are generated.
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Funnel summary (positive-path stages):")
-- MAGIC funnel_summary = spark.sql("""
-- MAGIC     SELECT current_status,
-- MAGIC            COUNT(*) AS application_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 / 5000, 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     WHERE current_status IN ('Enrolled', 'Offer Accepted', 'Offer Made',
-- MAGIC                              'Qualified', 'Under Review', 'Submitted')
-- MAGIC     GROUP BY current_status
-- MAGIC     ORDER BY
-- MAGIC       CASE current_status
-- MAGIC         WHEN 'Submitted'       THEN 1
-- MAGIC         WHEN 'Under Review'    THEN 2
-- MAGIC         WHEN 'Qualified'       THEN 3
-- MAGIC         WHEN 'Offer Made'      THEN 4
-- MAGIC         WHEN 'Offer Accepted'  THEN 5
-- MAGIC         WHEN 'Enrolled'        THEN 6
-- MAGIC       END
-- MAGIC """)
-- MAGIC funnel_summary.display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 20. Display: sample 20 records
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📋 Sample 20 records:")
-- MAGIC sample_df = spark.sql("""
-- MAGIC     SELECT application_id, applicant_id, program_id, campus_id, intake_id,
-- MAGIC            application_date, current_status
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC     ORDER BY application_id
-- MAGIC     LIMIT 20
-- MAGIC """)
-- MAGIC sample_df.display()

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import (
-- MAGIC     col, lit, when, expr, posexplode, sum as spark_sum, row_number
-- MAGIC )
-- MAGIC from pyspark.sql.window import Window
-- MAGIC from pyspark.sql.types import IntegerType, StringType, DateType
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 1. Create the application_stage_event Delta table (drop + recreate so
-- MAGIC #    that liquid clustering is applied for analytical workloads).
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC spark.sql("DROP TABLE IF EXISTS admissions_mvp.curated.application_stage_event")
-- MAGIC
-- MAGIC spark.sql("""
-- MAGIC CREATE TABLE admissions_mvp.curated.application_stage_event (
-- MAGIC   stage_history_id  INT,
-- MAGIC   application_id    INT,
-- MAGIC   stage_name        STRING,
-- MAGIC   stage_sequence    INT,
-- MAGIC   entered_date      DATE,
-- MAGIC   exited_date       DATE,
-- MAGIC   stage_outcome     STRING,
-- MAGIC   duration_days     INT
-- MAGIC )
-- MAGIC USING DELTA
-- MAGIC CLUSTER BY (application_id, stage_sequence);
-- MAGIC """)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 2. Load existing 5 000 application records
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC apps = spark.sql("""
-- MAGIC     SELECT application_id, application_date, current_status
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC """)
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 3. Determine the maximum positive-path stage each application reached
-- MAGIC #    and the outcome of the terminal (last) stage.
-- MAGIC #
-- MAGIC #    Positive-path mapping (from current_status):
-- MAGIC #      Submitted → 1, Under Review → 2, Qualified → 3,
-- MAGIC #      Offer Made → 4, Offer Accepted → 5, Enrolled → 6
-- MAGIC #
-- MAGIC #    For Withdrawn / Rejected the drop-off stage is assigned deterministically
-- MAGIC #    via pmod(hash(application_id), 1000) so that every re-run produces the
-- MAGIC #    identical journey for the same application (idempotent).  The distribution
-- MAGIC #    is weighted toward earlier stages to align with the funnel drop-off rates
-- MAGIC #    and to target ~15 000 total stage-event rows.
-- MAGIC #
-- MAGIC #    Funnel conversion rates (target):
-- MAGIC #      Submitted → Under Review = 85 %  (15 % drop at Submitted)
-- MAGIC #      Under Review → Qualified = 80 %  (20 % drop at Under Review)
-- MAGIC #      Qualified → Offer Made   = 65 %  (35 % drop at Qualified)
-- MAGIC #      Offer Made → Offer Accepted = 55 % (45 % drop at Offer Made)
-- MAGIC #      Offer Accepted → Enrolled = 90 %  (10 % drop at Offer Accepted)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC apps = apps.withColumn("_hash", expr("pmod(hash(application_id), 1000)"))
-- MAGIC
-- MAGIC apps = apps.withColumn(
-- MAGIC     "max_stage",
-- MAGIC     # --- positive-path statuses map directly ---
-- MAGIC     when(col("current_status") == "Enrolled",        lit(6))
-- MAGIC     .when(col("current_status") == "Offer Accepted", lit(5))
-- MAGIC     .when(col("current_status") == "Offer Made",      lit(4))
-- MAGIC     .when(col("current_status") == "Qualified",       lit(3))
-- MAGIC     .when(col("current_status") == "Under Review",    lit(2))
-- MAGIC     .when(col("current_status") == "Submitted",       lit(1))
-- MAGIC     # --- Withdrawn: weighted toward earlier stages ---
-- MAGIC     .when(col("current_status") == "Withdrawn",
-- MAGIC           when(col("_hash") < 400, lit(1))    # 40 % → Submitted
-- MAGIC           .when(col("_hash") < 600, lit(2))    # 20 % → Under Review
-- MAGIC           .when(col("_hash") < 750, lit(3))    # 15 % → Qualified
-- MAGIC           .when(col("_hash") < 900, lit(4))    # 15 % → Offer Made
-- MAGIC           .otherwise(lit(5)))                   # 10 % → Offer Accepted
-- MAGIC     # --- Rejected: weighted toward earlier stages ---
-- MAGIC     .when(col("current_status") == "Rejected",
-- MAGIC           when(col("_hash") < 350, lit(1))    # 35 % → Submitted
-- MAGIC           .when(col("_hash") < 600, lit(2))    # 25 % → Under Review
-- MAGIC           .when(col("_hash") < 800, lit(3))    # 20 % → Qualified
-- MAGIC           .when(col("_hash") < 950, lit(4))    # 15 % → Offer Made
-- MAGIC           .otherwise(lit(5)))                   #  5 % → Offer Accepted
-- MAGIC )
-- MAGIC
-- MAGIC # Terminal-stage outcome for each application
-- MAGIC apps = apps.withColumn(
-- MAGIC     "final_outcome",
-- MAGIC     when(col("current_status") == "Enrolled",   lit("Completed"))
-- MAGIC     .when(col("current_status") == "Withdrawn", lit("Withdrawn"))
-- MAGIC     .when(col("current_status") == "Rejected",  lit("Rejected"))
-- MAGIC     .otherwise(lit("Progressed"))   # still in process at current stage
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 4. Explode stage sequences 1 .. max_stage  (one row per lifecycle stage)
-- MAGIC #    Uses Spark sequence() + posexplode – fully vectorised, no row-by-row loop.
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC stages = (
-- MAGIC     apps.select(
-- MAGIC         col("application_id"),
-- MAGIC         col("application_date"),
-- MAGIC         col("max_stage"),
-- MAGIC         col("final_outcome"),
-- MAGIC         expr("sequence(1, max_stage, 1)").alias("stage_arr"),
-- MAGIC     )
-- MAGIC     .select(
-- MAGIC         col("application_id"),
-- MAGIC         col("application_date"),
-- MAGIC         col("max_stage"),
-- MAGIC         col("final_outcome"),
-- MAGIC         posexplode(col("stage_arr")).alias("pos", "stage_sequence"),
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 5. Assign stage_name (must exist in dim_stage)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC stages = stages.withColumn(
-- MAGIC     "stage_name",
-- MAGIC     when(col("stage_sequence") == 1, lit("Submitted"))
-- MAGIC     .when(col("stage_sequence") == 2, lit("Under Review"))
-- MAGIC     .when(col("stage_sequence") == 3, lit("Qualified"))
-- MAGIC     .when(col("stage_sequence") == 4, lit("Offer Made"))
-- MAGIC     .when(col("stage_sequence") == 5, lit("Offer Accepted"))
-- MAGIC     .when(col("stage_sequence") == 6, lit("Enrolled"))
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 6. Assign deterministic duration per stage
-- MAGIC #    hash(application_id, stage_sequence) keeps values stable across Spark
-- MAGIC #    re-evaluations, so no caching / checkpoint is required before the
-- MAGIC #    window-based cumulative sum in step 7.
-- MAGIC #
-- MAGIC #    Stage duration ranges:
-- MAGIC #      Submitted       1-3 days
-- MAGIC #      Under Review    3-10 days
-- MAGIC #      Qualified       2-5 days
-- MAGIC #      Offer Made      3-7 days
-- MAGIC #      Offer Accepted  1-15 days
-- MAGIC #      Enrolled        1-2 days  (final stage)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC stages = stages.withColumn(
-- MAGIC     "duration_days",
-- MAGIC     when(col("stage_sequence") == 1, expr("pmod(hash(application_id, 1), 3) + 1"))    # 1-3
-- MAGIC     .when(col("stage_sequence") == 2, expr("pmod(hash(application_id, 2), 8) + 3"))    # 3-10
-- MAGIC     .when(col("stage_sequence") == 3, expr("pmod(hash(application_id, 3), 4) + 2"))    # 2-5
-- MAGIC     .when(col("stage_sequence") == 4, expr("pmod(hash(application_id, 4), 5) + 3"))    # 3-7
-- MAGIC     .when(col("stage_sequence") == 5, expr("pmod(hash(application_id, 5), 15) + 1"))   # 1-15
-- MAGIC     .when(col("stage_sequence") == 6, expr("pmod(hash(application_id, 6), 2) + 1"))    # 1-2
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 7. Calculate entered_date and exited_date
-- MAGIC #    entered_date = application_date + Σ durations of all prior stages
-- MAGIC #    exited_date  = entered_date + duration_days
-- MAGIC #    Dates progress sequentially through the journey by construction.
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC w_cum = Window.partitionBy("application_id").orderBy("stage_sequence")
-- MAGIC
-- MAGIC stages = stages.withColumn(
-- MAGIC     "prior_duration",
-- MAGIC     (spark_sum("duration_days").over(w_cum) - col("duration_days")).cast("int"),
-- MAGIC )
-- MAGIC stages = stages.withColumn("entered_date", expr("date_add(application_date, prior_duration)"))
-- MAGIC stages = stages.withColumn("exited_date",  expr("date_add(entered_date, duration_days)"))
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 8. Determine stage_outcome
-- MAGIC #    Non-terminal stages → "Progressed"
-- MAGIC #    Terminal stage      → final_outcome ("Completed" / "Withdrawn" /
-- MAGIC #                                          "Rejected" / "Progressed")
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC stages = stages.withColumn(
-- MAGIC     "stage_outcome",
-- MAGIC     when(col("stage_sequence") == col("max_stage"), col("final_outcome"))
-- MAGIC     .otherwise(lit("Progressed")),
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 9. Generate unique sequential stage_history_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC w_id = Window.orderBy("application_id", "stage_sequence")
-- MAGIC stages = stages.withColumn("stage_history_id", row_number().over(w_id))
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 10. Select final columns in table-definition order (for insertInto)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC result = stages.select(
-- MAGIC     col("stage_history_id").cast(IntegerType()),
-- MAGIC     col("application_id").cast(IntegerType()),
-- MAGIC     col("stage_name").cast(StringType()),
-- MAGIC     col("stage_sequence").cast(IntegerType()),
-- MAGIC     col("entered_date").cast(DateType()),
-- MAGIC     col("exited_date").cast(DateType()),
-- MAGIC     col("stage_outcome").cast(StringType()),
-- MAGIC     col("duration_days").cast(IntegerType()),
-- MAGIC )
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 11. Write to the Delta table (INSERT OVERWRITE preserves clustering)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC result.write.insertInto("admissions_mvp.curated.application_stage_event", overwrite=True)
-- MAGIC
-- MAGIC print("✅ Data written to admissions_mvp.curated.application_stage_event")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 12. Validation: total stage event count
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Total stage event count:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT COUNT(*) AS total_events
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 13. Validation: distinct application count
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("📊 Distinct application count:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT COUNT(DISTINCT application_id) AS distinct_applications
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 14. Validation: stage_history_id uniqueness
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC dup_id = spark.sql("""
-- MAGIC     SELECT stage_history_id, COUNT(*) AS cnt
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     GROUP BY stage_history_id
-- MAGIC     HAVING COUNT(*) > 1
-- MAGIC """)
-- MAGIC dup_cnt = dup_id.count()
-- MAGIC if dup_cnt == 0:
-- MAGIC     print("✅ Validation passed: stage_history_id is unique.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {dup_cnt} duplicate stage_history_id values.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 15. Validation: FK — application_id
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC orphan_app = spark.sql("""
-- MAGIC     SELECT e.application_id
-- MAGIC     FROM admissions_mvp.curated.application_stage_event e
-- MAGIC     LEFT JOIN admissions_mvp.curated.application a
-- MAGIC       ON e.application_id = a.application_id
-- MAGIC     WHERE a.application_id IS NULL
-- MAGIC """)
-- MAGIC orphan_cnt = orphan_app.count()
-- MAGIC if orphan_cnt == 0:
-- MAGIC     print("✅ Validation passed: all application_id values reference valid application records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {orphan_cnt} orphan application_id values.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 16. Validation: FK — stage_name in dim_stage & stage_sequence match
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC try:
-- MAGIC     orphan_stage = spark.sql("""
-- MAGIC         SELECT DISTINCT e.stage_name
-- MAGIC         FROM admissions_mvp.curated.application_stage_event e
-- MAGIC         LEFT JOIN admissions_mvp.curated.dim_stage d
-- MAGIC           ON e.stage_name = d.stage_name
-- MAGIC         WHERE d.stage_name IS NULL
-- MAGIC     """)
-- MAGIC     orphan_stage_cnt = orphan_stage.count()
-- MAGIC     if orphan_stage_cnt == 0:
-- MAGIC         print("✅ Validation passed: all stage_name values exist in dim_stage.")
-- MAGIC     else:
-- MAGIC         print(f"❌ Validation FAILED: {orphan_stage_cnt} stage_name values not in dim_stage.")
-- MAGIC         orphan_stage.display()
-- MAGIC
-- MAGIC     mismatch_seq = spark.sql("""
-- MAGIC         SELECT e.application_id, e.stage_name, e.stage_sequence, d.stage_sequence AS dim_seq
-- MAGIC         FROM admissions_mvp.curated.application_stage_event e
-- MAGIC         JOIN admissions_mvp.curated.dim_stage d
-- MAGIC           ON e.stage_name = d.stage_name
-- MAGIC         WHERE e.stage_sequence != d.stage_sequence
-- MAGIC     """)
-- MAGIC     mismatch_cnt = mismatch_seq.count()
-- MAGIC     if mismatch_cnt == 0:
-- MAGIC         print("✅ Validation passed: stage_sequence matches dim_stage.")
-- MAGIC     else:
-- MAGIC         print(f"❌ Validation FAILED: {mismatch_cnt} stage_sequence mismatches.")
-- MAGIC         mismatch_seq.display()
-- MAGIC except Exception:
-- MAGIC     print("⚠️ dim_stage table not found – skipping stage_name / stage_sequence FK validation.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 17. Validation: date rules
-- MAGIC #    - exited_date > entered_date
-- MAGIC #    - duration_days = datediff(exited_date, entered_date)
-- MAGIC #    - entered_date >= application_date
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC bad_dates = spark.sql("""
-- MAGIC     SELECT COUNT(*) AS bad_date_count
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     WHERE entered_date IS NULL
-- MAGIC        OR exited_date IS NULL
-- MAGIC        OR exited_date <= entered_date
-- MAGIC        OR duration_days != datediff(exited_date, entered_date)
-- MAGIC """)
-- MAGIC bad_cnt = bad_dates.collect()[0]["bad_date_count"]
-- MAGIC if bad_cnt == 0:
-- MAGIC     print("✅ Validation passed: all date rules satisfied (exited > entered, duration_days correct).")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {bad_cnt} records violate date rules.")
-- MAGIC
-- MAGIC bad_entered = spark.sql("""
-- MAGIC     SELECT COUNT(*) AS bad_count
-- MAGIC     FROM admissions_mvp.curated.application_stage_event e
-- MAGIC     JOIN admissions_mvp.curated.application a
-- MAGIC       ON e.application_id = a.application_id
-- MAGIC     WHERE e.entered_date < a.application_date
-- MAGIC """)
-- MAGIC bad_entered_cnt = bad_entered.collect()[0]["bad_count"]
-- MAGIC if bad_entered_cnt == 0:
-- MAGIC     print("✅ Validation passed: entered_date >= application_date for all records.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {bad_entered_cnt} records have entered_date < application_date.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 18. Validation: 1–6 stages per application
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC stages_per_app = spark.sql("""
-- MAGIC     SELECT application_id, COUNT(*) AS stage_count
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     GROUP BY application_id
-- MAGIC     HAVING COUNT(*) < 1 OR COUNT(*) > 6
-- MAGIC """)
-- MAGIC bad_stage_cnt = stages_per_app.count()
-- MAGIC if bad_stage_cnt == 0:
-- MAGIC     print("✅ Validation passed: every application has between 1 and 6 stages.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {bad_stage_cnt} applications have < 1 or > 6 stages.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 19. Validation: no stages after Withdrawn / Rejected
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC post_terminal = spark.sql("""
-- MAGIC     WITH terminal_apps AS (
-- MAGIC         SELECT application_id, MAX(stage_sequence) AS max_seq
-- MAGIC         FROM admissions_mvp.curated.application_stage_event
-- MAGIC         WHERE stage_outcome IN ('Withdrawn', 'Rejected')
-- MAGIC         GROUP BY application_id
-- MAGIC     )
-- MAGIC     SELECT e.application_id, e.stage_sequence, e.stage_outcome
-- MAGIC     FROM admissions_mvp.curated.application_stage_event e
-- MAGIC     JOIN terminal_apps t ON e.application_id = t.application_id
-- MAGIC     WHERE e.stage_sequence > t.max_seq
-- MAGIC """)
-- MAGIC post_terminal_cnt = post_terminal.count()
-- MAGIC if post_terminal_cnt == 0:
-- MAGIC     print("✅ Validation passed: no stages created after Withdrawn or Rejected.")
-- MAGIC else:
-- MAGIC     print(f"❌ Validation FAILED: {post_terminal_cnt} stages found after terminal stage.")
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 20. Funnel counts by stage
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Funnel counts by stage:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT stage_name,
-- MAGIC            stage_sequence,
-- MAGIC            COUNT(*)               AS event_count,
-- MAGIC            COUNT(DISTINCT application_id) AS applicant_count
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     GROUP BY stage_name, stage_sequence
-- MAGIC     ORDER BY stage_sequence
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 21. Conversion percentage between stages
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Conversion percentage between stages:")
-- MAGIC spark.sql("""
-- MAGIC     WITH stage_counts AS (
-- MAGIC         SELECT stage_sequence, COUNT(DISTINCT application_id) AS app_count
-- MAGIC         FROM admissions_mvp.curated.application_stage_event
-- MAGIC         GROUP BY stage_sequence
-- MAGIC     ),
-- MAGIC     stage_pairs AS (
-- MAGIC         SELECT
-- MAGIC             a.stage_sequence AS from_stage,
-- MAGIC             a.app_count      AS from_count,
-- MAGIC             b.stage_sequence AS to_stage,
-- MAGIC             b.app_count      AS to_count
-- MAGIC         FROM stage_counts a
-- MAGIC         JOIN stage_counts b ON a.stage_sequence + 1 = b.stage_sequence
-- MAGIC     )
-- MAGIC     SELECT
-- MAGIC         from_stage,
-- MAGIC         to_stage,
-- MAGIC         from_count,
-- MAGIC         to_count,
-- MAGIC         ROUND(to_count * 100.0 / from_count, 1) AS conversion_pct
-- MAGIC     FROM stage_pairs
-- MAGIC     ORDER BY from_stage
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 22. Drop-off percentage by stage
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Drop-off percentage by stage:")
-- MAGIC spark.sql("""
-- MAGIC     WITH stage_counts AS (
-- MAGIC         SELECT stage_sequence, COUNT(DISTINCT application_id) AS app_count
-- MAGIC         FROM admissions_mvp.curated.application_stage_event
-- MAGIC         GROUP BY stage_sequence
-- MAGIC     ),
-- MAGIC     stage_pairs AS (
-- MAGIC         SELECT
-- MAGIC             a.stage_sequence AS stage,
-- MAGIC             a.app_count      AS at_stage,
-- MAGIC             b.app_count      AS next_stage
-- MAGIC         FROM stage_counts a
-- MAGIC         LEFT JOIN stage_counts b ON a.stage_sequence + 1 = b.stage_sequence
-- MAGIC     )
-- MAGIC     SELECT
-- MAGIC         stage,
-- MAGIC         at_stage,
-- MAGIC         COALESCE(next_stage, 0)                          AS progressed_to_next,
-- MAGIC         at_stage - COALESCE(next_stage, 0)               AS dropped_off,
-- MAGIC         ROUND((at_stage - COALESCE(next_stage, 0)) * 100.0 / at_stage, 1) AS drop_off_pct
-- MAGIC     FROM stage_pairs
-- MAGIC     ORDER BY stage
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 23. Average duration_days by stage
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Average duration_days by stage:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT stage_name,
-- MAGIC            stage_sequence,
-- MAGIC            COUNT(*)                  AS event_count,
-- MAGIC            ROUND(AVG(duration_days), 1) AS avg_duration_days,
-- MAGIC            MIN(duration_days)        AS min_duration,
-- MAGIC            MAX(duration_days)        AS max_duration
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     GROUP BY stage_name, stage_sequence
-- MAGIC     ORDER BY stage_sequence
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 24. Stage outcome distribution
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📊 Stage outcome distribution:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT stage_outcome,
-- MAGIC            COUNT(*) AS event_count,
-- MAGIC            ROUND(COUNT(*) * 100.0 /
-- MAGIC                  (SELECT COUNT(*) FROM admissions_mvp.curated.application_stage_event), 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     GROUP BY stage_outcome
-- MAGIC     ORDER BY event_count DESC
-- MAGIC """).display()
-- MAGIC
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC # 25. Sample records (first 20 applications, all their stages)
-- MAGIC # ---------------------------------------------------------------------------
-- MAGIC print("\n📋 Sample 20 records:")
-- MAGIC spark.sql("""
-- MAGIC     SELECT stage_history_id, application_id, stage_name, stage_sequence,
-- MAGIC            entered_date, exited_date, stage_outcome, duration_days
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC     ORDER BY application_id, stage_sequence
-- MAGIC     LIMIT 20
-- MAGIC """).display()

-- COMMAND ----------

-- ===========================================================================
-- Generate and insert review records into admissions_mvp.curated.review
-- Only for applications that reached the "Under Review" stage.
-- ===========================================================================

-- 1. Drop & recreate the review table with liquid clustering
DROP TABLE IF EXISTS admissions_mvp.curated.review;

CREATE TABLE admissions_mvp.curated.review (
  review_id         INT,
  application_id    INT,
  counselor_id      INT,
  review_status     STRING,
  review_start_date DATE,
  review_end_date   DATE
)
USING DELTA
CLUSTER BY (application_id, counselor_id);

-- 2. Insert reviews for every application that reached Under Review
INSERT INTO admissions_mvp.curated.review
WITH under_review_apps AS (
  -- One row per application that reached the Under Review stage
  SELECT application_id,
         entered_date AS under_review_date
  FROM admissions_mvp.curated.application_stage_event
  WHERE stage_name = 'Under Review'
),
counselor_list AS (
  -- Number counselors 0..49 so we can round-robin assign
  SELECT counselor_id,
         ROW_NUMBER() OVER (ORDER BY counselor_id) - 1 AS counselor_idx
  FROM admissions_mvp.curated.counselor
),
app_numbered AS (
  SELECT application_id,
         under_review_date,
         ROW_NUMBER() OVER (ORDER BY application_id) - 1 AS app_rn,
         pmod(hash(application_id), 100) AS status_hash
  FROM under_review_apps
),
review_data AS (
  SELECT
    a.application_id,
    a.under_review_date,
    a.app_rn,
    CASE
      WHEN a.status_hash <  70 THEN 'Completed'
      WHEN a.status_hash <  85 THEN 'In Progress'
      WHEN a.status_hash <  95 THEN 'Rejected'
      ELSE                        'Pending'
    END AS review_status,
    pmod(hash(a.application_id, 1), 13) + 2 AS duration_days  -- 2–14 days
  FROM app_numbered a
)
SELECT
  ROW_NUMBER() OVER (ORDER BY r.application_id)        AS review_id,
  r.application_id                                      AS application_id,
  c.counselor_id                                         AS counselor_id,
  r.review_status                                       AS review_status,
  DATE_ADD(r.under_review_date, 1)                       AS review_start_date,
  CASE
    WHEN r.review_status IN ('Completed', 'Rejected')
      THEN DATE_ADD(DATE_ADD(r.under_review_date, 1), r.duration_days)
    ELSE NULL
  END                                                    AS review_end_date
FROM review_data r
JOIN counselor_list c
  ON pmod(r.app_rn, 50) = c.counselor_idx;

-- ===========================================================================
-- 3. Validation
-- ===========================================================================

-- 3a. Total review count
SELECT COUNT(*) AS total_reviews
FROM admissions_mvp.curated.review;

-- 3b. Reviews by review_status
SELECT review_status,
       COUNT(*)                                  AS review_count,
       ROUND(COUNT(*) * 100.0 /
            (SELECT COUNT(*) FROM admissions_mvp.curated.review), 1) AS pct
FROM admissions_mvp.curated.review
GROUP BY review_status
ORDER BY review_count DESC;

-- 3c. Reviews by counselor
SELECT c.counselor_id,
       c.counselor_name,
       COUNT(r.review_id) AS review_count
FROM admissions_mvp.curated.counselor c
LEFT JOIN admissions_mvp.curated.review r
  ON c.counselor_id = r.counselor_id
GROUP BY c.counselor_id, c.counselor_name
ORDER BY review_count DESC;

-- 3d. Average review duration (completed & rejected only — those have end dates)
SELECT ROUND(AVG(DATEDIFF(review_end_date, review_start_date)), 1) AS avg_duration_days,
       MIN(DATEDIFF(review_end_date, review_start_date))          AS min_duration_days,
       MAX(DATEDIFF(review_end_date, review_start_date))          AS max_duration_days
FROM admissions_mvp.curated.review
WHERE review_end_date IS NOT NULL;

-- 3e. Eligible applications without reviews (should be zero)
SELECT COUNT(*) AS eligible_apps_without_reviews
FROM (
    SELECT DISTINCT e.application_id
    FROM admissions_mvp.curated.application_stage_event e
    WHERE e.stage_name = 'Under Review'
) eligible
LEFT JOIN admissions_mvp.curated.review r
  ON eligible.application_id = r.application_id
WHERE r.review_id IS NULL;

-- 3f. FK validation — application_id
SELECT COUNT(*) AS orphan_application_ids
FROM admissions_mvp.curated.review r
LEFT JOIN admissions_mvp.curated.application a
  ON r.application_id = a.application_id
WHERE a.application_id IS NULL;

-- 3g. FK validation — counselor_id
SELECT COUNT(*) AS orphan_counselor_ids
FROM admissions_mvp.curated.review r
LEFT JOIN admissions_mvp.curated.counselor c
  ON r.counselor_id = c.counselor_id
WHERE c.counselor_id IS NULL;

-- 3h. Date rule validation
SELECT COUNT(*) AS bad_date_count
FROM admissions_mvp.curated.review r
JOIN admissions_mvp.curated.application_stage_event e
  ON r.application_id = e.application_id
 AND e.stage_name = 'Under Review'
WHERE r.review_start_date <= e.entered_date                    -- start must be after Under Review entered_date
   OR (r.review_end_date IS NOT NULL
       AND r.review_end_date <= r.review_start_date)          -- end must be after start
   OR (r.review_end_date IS NOT NULL
       AND DATEDIFF(r.review_end_date, r.review_start_date) < 2)  -- duration >= 2
   OR (r.review_end_date IS NOT NULL
       AND DATEDIFF(r.review_end_date, r.review_start_date) > 14); -- duration <= 14

-- 3i. Duplicate review per application (should be zero)
SELECT COUNT(*) AS duplicate_application_reviews
FROM (
  SELECT application_id, COUNT(*) AS cnt
  FROM admissions_mvp.curated.review
  GROUP BY application_id
  HAVING COUNT(*) > 1
) dups;

-- 3j. Sample records
SELECT * FROM admissions_mvp.curated.review
ORDER BY review_id
LIMIT 20;

-- COMMAND ----------

-- ===========================================================================
-- Generate and insert offer records into admissions_mvp.curated.offer
-- Only for applications that successfully reached the "Offer Made" stage.
-- ===========================================================================

-- 1. Drop & recreate the offer table with liquid clustering
DROP TABLE IF EXISTS admissions_mvp.curated.offer;

CREATE TABLE admissions_mvp.curated.offer (
  offer_id         INT,
  application_id   INT,
  offer_date       DATE,
  offer_status     STRING
)
USING DELTA
CLUSTER BY (application_id);

-- 2. Insert offers for every application that reached the Offer Made stage
INSERT INTO admissions_mvp.curated.offer
WITH offer_made_apps AS (
  -- One row per application that reached the Offer Made stage
  SELECT application_id,
         entered_date AS offer_made_date
  FROM admissions_mvp.curated.application_stage_event
  WHERE stage_name = 'Offer Made'
),
review_dates AS (
  -- Latest review completion date per application (if any review was completed)
  SELECT application_id,
         MAX(review_end_date) AS max_review_end_date
  FROM admissions_mvp.curated.review
  WHERE review_end_date IS NOT NULL
  GROUP BY application_id
),
offer_base AS (
  SELECT
    o.application_id,
    o.offer_made_date,
    -- offer_date must be after Offer Made entered_date AND after any review completion
    GREATEST(o.offer_made_date, COALESCE(r.max_review_end_date, o.offer_made_date)) AS earliest_offer_date,
    -- Deterministic offer-status assignment (stable across re-runs)
    pmod(hash(o.application_id), 100) AS status_hash,
    -- Deterministic 1–7 day offset so offer_date is strictly after the earliest date
    pmod(hash(o.application_id, 7), 7) + 1 AS day_offset
  FROM offer_made_apps o
  LEFT JOIN review_dates r
    ON o.application_id = r.application_id
)
SELECT
  ROW_NUMBER() OVER (ORDER BY application_id)            AS offer_id,
  application_id                                       AS application_id,
  DATE_ADD(earliest_offer_date, day_offset)             AS offer_date,
  CASE
    WHEN status_hash <  35 THEN 'Issued'     -- 35 %
    WHEN status_hash <  75 THEN 'Accepted'    -- 40 %
    WHEN status_hash <  95 THEN 'Declined'   -- 20 %
    ELSE                       'Expired'     --  5 %
  END                                                  AS offer_status
FROM offer_base;

-- ===========================================================================
-- 3. Validation
-- ===========================================================================

-- 3a. Total offer count
SELECT COUNT(*) AS total_offers
FROM admissions_mvp.curated.offer;

-- 3b. Offer count by status (with percentage)
SELECT offer_status,
       COUNT(*)                                  AS offer_count,
       ROUND(COUNT(*) * 100.0 /
            (SELECT COUNT(*) FROM admissions_mvp.curated.offer), 1) AS pct
FROM admissions_mvp.curated.offer
GROUP BY offer_status
ORDER BY offer_count DESC;

-- 3c. Offer acceptance rate
SELECT ROUND(
         SUM(CASE WHEN offer_status = 'Accepted' THEN 1 ELSE 0 END) * 100.0 /
         COUNT(*), 1
       ) AS offer_acceptance_rate_pct
FROM admissions_mvp.curated.offer;

-- 3d. Distinct applications with offers (must equal total — one offer per app)
SELECT COUNT(DISTINCT application_id) AS distinct_applications_with_offers
FROM admissions_mvp.curated.offer;

-- 3e. Applications reaching Offer Made without offers (should be zero)
SELECT COUNT(*) AS offer_made_apps_without_offers
FROM (
    SELECT DISTINCT e.application_id
    FROM admissions_mvp.curated.application_stage_event e
    WHERE e.stage_name = 'Offer Made'
) eligible
LEFT JOIN admissions_mvp.curated.offer o
  ON eligible.application_id = o.application_id
WHERE o.offer_id IS NULL;

-- 3f. Duplicate offers per application (should be zero)
SELECT COUNT(*) AS duplicate_application_offers
FROM (
  SELECT application_id, COUNT(*) AS cnt
  FROM admissions_mvp.curated.offer
  GROUP BY application_id
  HAVING COUNT(*) > 1
) dups;

-- 3g. FK validation — application_id
SELECT COUNT(*) AS orphan_application_ids
FROM admissions_mvp.curated.offer o
LEFT JOIN admissions_mvp.curated.application a
  ON o.application_id = a.application_id
WHERE a.application_id IS NULL;

-- 3h. Date rule validation
--     offer_date must be after the Offer Made stage entered_date
--     offer_date must be after any review completion date (where applicable)
SELECT COUNT(*) AS bad_date_count
FROM admissions_mvp.curated.offer o
JOIN admissions_mvp.curated.application_stage_event e
  ON o.application_id = e.application_id
 AND e.stage_name = 'Offer Made'
LEFT JOIN (
    SELECT application_id, MAX(review_end_date) AS max_review_end_date
    FROM admissions_mvp.curated.review
    WHERE review_end_date IS NOT NULL
    GROUP BY application_id
) r
  ON o.application_id = r.application_id
WHERE o.offer_date <= e.entered_date
   OR (r.max_review_end_date IS NOT NULL
       AND o.offer_date <= r.max_review_end_date);

-- 3i. Sample records
SELECT * FROM admissions_mvp.curated.offer
ORDER BY offer_id
LIMIT 20;

-- COMMAND ----------

-- ===========================================================================
-- Generate and insert enrollment records into admissions_mvp.curated.enrollment
-- Only for offers where offer_status = 'Accepted'.
-- ===========================================================================

-- 1. Drop & recreate the enrollment table with liquid clustering
DROP TABLE IF EXISTS admissions_mvp.curated.enrollment;

CREATE TABLE admissions_mvp.curated.enrollment (
  enrollment_id     INT,
  offer_id          INT,
  enrollment_date   DATE,
  enrollment_status STRING
)
USING DELTA
CLUSTER BY (offer_id);

-- 2. Insert enrollments for every accepted offer (one per offer)
INSERT INTO admissions_mvp.curated.enrollment
WITH accepted_offers AS (
  SELECT o.offer_id,
         o.application_id,
         o.offer_date
  FROM admissions_mvp.curated.offer o
  WHERE o.offer_status = 'Accepted'
),
stage_events AS (
  -- Get the Offer Accepted and Enrolled stage dates per application
  SELECT application_id,
         MAX(CASE WHEN stage_name = 'Offer Accepted' THEN entered_date END) AS offer_accepted_date,
         MAX(CASE WHEN stage_name = 'Enrolled'          THEN entered_date END) AS enrolled_date
  FROM admissions_mvp.curated.application_stage_event
  WHERE stage_name IN ('Offer Accepted', 'Enrolled')
  GROUP BY application_id
),
enrollment_base AS (
  SELECT
    a.offer_id,
    a.application_id,
    a.offer_date,
    -- If the application reached 'Enrolled', the enrollment_date should be
    -- the Enrolled stage entered_date (or a deterministic date after the
    -- Offer Accepted date); otherwise derive a deterministic date.
    COALESCE(
      s.enrolled_date,
      DATE_ADD(a.offer_date, pmod(hash(a.offer_id, 1), 90) + 1)  -- 1–90 days after offer_date
    ) AS enrollment_date_raw,
    -- Deterministic enrollment-status assignment (stable across re-runs)
    -- Enrolled 75 %, Deferred 15 %, Cancelled 7 %, No Show 3 %
    pmod(hash(a.offer_id), 100) AS status_hash
  FROM accepted_offers a
  LEFT JOIN stage_events s
    ON a.application_id = s.application_id
)
SELECT
  ROW_NUMBER() OVER (ORDER BY offer_id)            AS enrollment_id,
  offer_id                                         AS offer_id,
  -- Ensure enrollment_date is after offer_date and within the last 2 academic years
  CASE
    WHEN enrollment_date_raw < offer_date
      THEN DATE_ADD(offer_date, 1)                  -- safety: must be after offer_date
    ELSE enrollment_date_raw
  END                                              AS enrollment_date,
  CASE
    WHEN status_hash <  75 THEN 'Enrolled'           -- 75 %
    WHEN status_hash <  90 THEN 'Deferred'           -- 15 %
    WHEN status_hash <  97 THEN 'Cancelled'          --  7 %
    ELSE                         'No Show'          --  3 %
  END                                              AS enrollment_status
FROM enrollment_base;

-- ===========================================================================
-- 3. Validation
-- ===========================================================================

-- 3a. Total enrollment count
SELECT COUNT(*) AS total_enrollments
FROM admissions_mvp.curated.enrollment;

-- 3b. Enrollment count by enrollment_status (with percentage)
SELECT enrollment_status,
       COUNT(*)                                  AS enrollment_count,
       ROUND(COUNT(*) * 100.0 /
            (SELECT COUNT(*) FROM admissions_mvp.curated.enrollment), 1) AS pct
FROM admissions_mvp.curated.enrollment
GROUP BY enrollment_status
ORDER BY enrollment_count DESC;

-- 3c. Enrollment Yield Rate
--    = (# Enrolled) / (# Accepted offers) * 100
SELECT ROUND(
         SUM(CASE WHEN e.enrollment_status = 'Enrolled' THEN 1 ELSE 0 END) * 100.0 /
         (SELECT COUNT(*) FROM admissions_mvp.curated.offer WHERE offer_status = 'Accepted'),
         1
       ) AS enrollment_yield_rate_pct
FROM admissions_mvp.curated.enrollment e;

-- 3d. Distinct accepted offers with enrollments
SELECT COUNT(DISTINCT offer_id) AS distinct_accepted_offers_with_enrollments
FROM admissions_mvp.curated.enrollment;

-- 3e. Accepted offers without enrollment records (should be zero — every accepted offer gets one enrollment)
SELECT COUNT(*) AS accepted_offers_without_enrollments
FROM (
    SELECT offer_id
    FROM admissions_mvp.curated.offer
    WHERE offer_status = 'Accepted'
) accepted
LEFT JOIN admissions_mvp.curated.enrollment e
  ON accepted.offer_id = e.offer_id
WHERE e.enrollment_id IS NULL;

-- 3f. Duplicate enrollments per offer (should be zero)
SELECT COUNT(*) AS duplicate_offer_enrollments
FROM (
  SELECT offer_id, COUNT(*) AS cnt
  FROM admissions_mvp.curated.enrollment
  GROUP BY offer_id
  HAVING COUNT(*) > 1
) dups;

-- 3g. FK validation — offer_id must reference accepted offers only
SELECT COUNT(*) AS orphan_or_non_accepted_offer_ids
FROM admissions_mvp.curated.enrollment e
LEFT JOIN admissions_mvp.curated.offer o
  ON e.offer_id = o.offer_id
WHERE o.offer_id IS NULL
   OR o.offer_status <> 'Accepted';

-- 3h. Date rule validation
--     enrollment_date must be after offer_date
SELECT COUNT(*) AS bad_date_count
FROM admissions_mvp.curated.enrollment e
JOIN admissions_mvp.curated.offer o
  ON e.offer_id = o.offer_id
WHERE e.enrollment_date <= o.offer_date;

-- 3i. Enrollment status distribution sanity check (ensure all 4 statuses present)
SELECT COUNT(DISTINCT enrollment_status) AS distinct_statuses
FROM admissions_mvp.curated.enrollment;

-- 3j. Sample records
SELECT e.enrollment_id,
       e.offer_id,
       o.application_id,
       o.offer_date,
       e.enrollment_date,
       e.enrollment_status
FROM admissions_mvp.curated.enrollment e
JOIN admissions_mvp.curated.offer o
  ON e.offer_id = o.offer_id
ORDER BY e.enrollment_id
LIMIT 20;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql.functions import (
-- MAGIC     col, lit, when, expr, explode,
-- MAGIC     sum as spark_sum, count, avg, max as spark_max, min as spark_min,
-- MAGIC     row_number, round as spark_round
-- MAGIC )
-- MAGIC from pyspark.sql.window import Window
-- MAGIC import pyspark.sql.functions as F
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 1. Drop & recreate the communication_activity Delta table
-- MAGIC # ===========================================================================
-- MAGIC spark.sql("DROP TABLE IF EXISTS admissions_mvp.curated.communication_activity")
-- MAGIC
-- MAGIC spark.sql("""
-- MAGIC CREATE TABLE admissions_mvp.curated.communication_activity (
-- MAGIC   communication_id INT,
-- MAGIC   applicant_id     INT,
-- MAGIC   activity_type    STRING,
-- MAGIC   activity_date    DATE,
-- MAGIC   direction        STRING
-- MAGIC )
-- MAGIC USING DELTA
-- MAGIC CLUSTER BY (applicant_id);
-- MAGIC """)
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 2. Load source tables
-- MAGIC # ===========================================================================
-- MAGIC applicants = spark.sql("""
-- MAGIC     SELECT applicant_id, created_date
-- MAGIC     FROM admissions_mvp.curated.applicant
-- MAGIC """)
-- MAGIC
-- MAGIC applications = spark.sql("""
-- MAGIC     SELECT application_id, applicant_id, application_date, current_status
-- MAGIC     FROM admissions_mvp.curated.application
-- MAGIC """)
-- MAGIC
-- MAGIC stage_events = spark.sql("""
-- MAGIC     SELECT application_id, stage_name, stage_sequence, entered_date
-- MAGIC     FROM admissions_mvp.curated.application_stage_event
-- MAGIC """)
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 3. Build per-application journey profile
-- MAGIC #    - max_stage:       highest stage sequence reached
-- MAGIC #    - journey_start:   earliest stage entered_date (fallback: application_date)
-- MAGIC #    - journey_end:     latest stage entered_date (fallback: application_date)
-- MAGIC #    - is_dropped_off:  1 if Withdrawn / Rejected, else 0
-- MAGIC # ===========================================================================
-- MAGIC stage_summary = stage_events.groupBy("application_id").agg(
-- MAGIC     spark_max("stage_sequence").alias("max_stage"),
-- MAGIC     spark_max("entered_date").alias("journey_end"),
-- MAGIC     spark_min("entered_date").alias("journey_start"),
-- MAGIC )
-- MAGIC
-- MAGIC app_profile = (
-- MAGIC     applications
-- MAGIC     .join(stage_summary, "application_id", "left")
-- MAGIC     .join(applicants, "applicant_id", "left")
-- MAGIC     .withColumn("is_dropped_off",
-- MAGIC         when(col("current_status").isin("Withdrawn", "Rejected"), lit(1))
-- MAGIC         .otherwise(lit(0))
-- MAGIC     )
-- MAGIC     .withColumn("journey_start",
-- MAGIC         F.coalesce(col("journey_start"), col("application_date"), col("created_date"))
-- MAGIC     )
-- MAGIC     .withColumn("journey_end",
-- MAGIC         F.coalesce(col("journey_end"), col("application_date"), col("created_date"))
-- MAGIC     )
-- MAGIC     .withColumn("journey_end",
-- MAGIC         when(col("journey_end") < col("journey_start"), col("journey_start"))
-- MAGIC         .otherwise(col("journey_end"))
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 4. Determine number of communications per application
-- MAGIC #
-- MAGIC #    Drop-off applicants get fewer communications (reduced engagement).
-- MAGIC #    Positive-path applicants get more as they progress further.
-- MAGIC #
-- MAGIC #    Targeting ~20 000 total across 5 000 applications.
-- MAGIC # ===========================================================================
-- MAGIC app_profile = app_profile.withColumn(
-- MAGIC     "num_communications",
-- MAGIC     # --- Dropped-off: reduced volume ---
-- MAGIC     when(
-- MAGIC         (col("is_dropped_off") == 1) & (col("max_stage") <= 2),
-- MAGIC         expr("pmod(hash(application_id), 3) + 1")        # 1–3,  avg ~2
-- MAGIC     ).when(
-- MAGIC         (col("is_dropped_off") == 1) & (col("max_stage") <= 4),
-- MAGIC         expr("pmod(hash(application_id), 5) + 1")          # 1–5,  avg ~3
-- MAGIC     ).when(
-- MAGIC         col("is_dropped_off") == 1,
-- MAGIC         expr("pmod(hash(application_id), 4) + 3")         # 3–6,  avg ~4.5
-- MAGIC     )
-- MAGIC     # --- Positive path: scale with stage ---
-- MAGIC     .when(
-- MAGIC         col("max_stage") <= 2,
-- MAGIC         expr("pmod(hash(application_id), 4) + 2")         # 2–5,  avg ~3.5
-- MAGIC     ).when(
-- MAGIC         col("max_stage") <= 4,
-- MAGIC         expr("pmod(hash(application_id), 5) + 3")           # 3–7,  avg ~5
-- MAGIC     ).when(
-- MAGIC         col("max_stage") == 5,
-- MAGIC         expr("pmod(hash(application_id), 8) + 5")          # 5–12, avg ~9
-- MAGIC     ).otherwise(
-- MAGIC         expr("pmod(hash(application_id), 7) + 5")           # 5–11, avg ~8
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 5. Explode one row per communication
-- MAGIC # ===========================================================================
-- MAGIC comm_base = app_profile.withColumn(
-- MAGIC     "comm_idx",
-- MAGIC     explode(expr("sequence(1, CAST(num_communications AS INT))"))
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 6. Assign each communication to a lifecycle stage
-- MAGIC #    Distribute proportionally across stages 1..max_stage
-- MAGIC # ===========================================================================
-- MAGIC comm_base = comm_base.withColumn(
-- MAGIC     "comm_stage",
-- MAGIC     F.coalesce(
-- MAGIC         F.least(
-- MAGIC             F.ceil(expr("comm_idx * max_stage / num_communications")),
-- MAGIC             col("max_stage")
-- MAGIC         ),
-- MAGIC         lit(1)
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 7. Assign activity_type based on stage & engagement logic
-- MAGIC #
-- MAGIC #    Overall target:  Email 55 %, Phone 20 %, SMS 15 %, Meeting 10 %
-- MAGIC #    Per-stage skewing reflects the types of communication at each stage:
-- MAGIC #      Stage 1 (Submitted):      Welcome/Reminder Email, SMS
-- MAGIC #      Stage 2 (Under Review):  Counselor outreach, Phone, Status updates
-- MAGIC #      Stage 3 (Qualified):     Program discussions, Meetings, Follow-up
-- MAGIC #      Stage 4 (Offer Made):    Offer notification, Scholarship discussion
-- MAGIC #      Stage 5 (Offer Accepted): Enrollment guidance, Onboarding
-- MAGIC #      Stage 6 (Enrolled):      Orientation communication
-- MAGIC # ===========================================================================
-- MAGIC comm_base = comm_base.withColumn(
-- MAGIC     "activity_hash",
-- MAGIC     expr("pmod(hash(application_id, comm_idx), 100)")
-- MAGIC ).withColumn(
-- MAGIC     "activity_type",
-- MAGIC     when(col("comm_stage") == 1,                     # Submitted
-- MAGIC         when(col("activity_hash") < 60, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 80, lit("SMS"))
-- MAGIC         .when(col("activity_hash") < 95, lit("Phone"))
-- MAGIC         .otherwise(lit("Meeting"))
-- MAGIC     ).when(col("comm_stage") == 2,                    # Under Review
-- MAGIC         when(col("activity_hash") < 50, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 80, lit("Phone"))
-- MAGIC         .when(col("activity_hash") < 95, lit("SMS"))
-- MAGIC         .otherwise(lit("Meeting"))
-- MAGIC     ).when(col("comm_stage") == 3,                    # Qualified
-- MAGIC         when(col("activity_hash") < 50, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 75, lit("Meeting"))
-- MAGIC         .when(col("activity_hash") < 95, lit("Phone"))
-- MAGIC         .otherwise(lit("SMS"))
-- MAGIC     ).when(col("comm_stage") == 4,                    # Offer Made
-- MAGIC         when(col("activity_hash") < 55, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 75, lit("Meeting"))
-- MAGIC         .when(col("activity_hash") < 95, lit("Phone"))
-- MAGIC         .otherwise(lit("SMS"))
-- MAGIC     ).when(col("comm_stage") == 5,                    # Offer Accepted
-- MAGIC         when(col("activity_hash") < 65, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 90, lit("Phone"))
-- MAGIC         .otherwise(lit("Meeting"))
-- MAGIC     ).otherwise(                                     # Enrolled (stage 6)
-- MAGIC         when(col("activity_hash") < 60, lit("Email"))
-- MAGIC         .when(col("activity_hash") < 80, lit("Meeting"))
-- MAGIC         .when(col("activity_hash") < 95, lit("Phone"))
-- MAGIC         .otherwise(lit("SMS"))
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 8. Assign direction:  Outbound 70 %, Inbound 30 %
-- MAGIC #    Drop-offs get fewer inbound (85 % outbound)
-- MAGIC # ===========================================================================
-- MAGIC comm_base = comm_base.withColumn(
-- MAGIC     "direction_hash",
-- MAGIC     expr("pmod(hash(application_id, comm_idx, 1), 100)")
-- MAGIC ).withColumn(
-- MAGIC     "direction",
-- MAGIC     when(
-- MAGIC         col("is_dropped_off") == 1,
-- MAGIC         when(col("direction_hash") < 85, lit("Outbound"))
-- MAGIC         .otherwise(lit("Inbound"))
-- MAGIC     ).otherwise(
-- MAGIC         when(col("direction_hash") < 70, lit("Outbound"))
-- MAGIC         .otherwise(lit("Inbound"))
-- MAGIC     )
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 9. Assign activity_date within the journey timeline
-- MAGIC #    Distribute naturally: earlier comm_idx → earlier date
-- MAGIC # ===========================================================================
-- MAGIC comm_base = comm_base.withColumn(
-- MAGIC     "journey_days",
-- MAGIC     F.datediff(col("journey_end"), col("journey_start"))
-- MAGIC ).withColumn(
-- MAGIC     "day_offset",
-- MAGIC     F.least(
-- MAGIC         F.floor(expr("comm_idx * journey_days / num_communications")),
-- MAGIC         col("journey_days")
-- MAGIC     ).cast("int")
-- MAGIC ).withColumn(
-- MAGIC     "activity_date",
-- MAGIC     F.date_add(col("journey_start"), col("day_offset"))
-- MAGIC )
-- MAGIC
-- MAGIC # Edge case: zero-day journey → small deterministic offset
-- MAGIC comm_base = comm_base.withColumn(
-- MAGIC     "activity_date",
-- MAGIC     when(col("journey_days") == 0,
-- MAGIC         F.date_add(col("journey_start"), expr("pmod(hash(application_id, comm_idx), 3)"))
-- MAGIC     ).otherwise(col("activity_date"))
-- MAGIC )
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 10. Assign unique communication_id and write to Delta table
-- MAGIC # ===========================================================================
-- MAGIC w_id = Window.orderBy("application_id", "comm_idx")
-- MAGIC
-- MAGIC comm_final = (
-- MAGIC     comm_base
-- MAGIC     .withColumn("communication_id", row_number().over(w_id))
-- MAGIC     .select(
-- MAGIC         "communication_id",
-- MAGIC         "applicant_id",
-- MAGIC         "activity_type",
-- MAGIC         "activity_date",
-- MAGIC         "direction",
-- MAGIC     )
-- MAGIC     .orderBy("communication_id")
-- MAGIC )
-- MAGIC
-- MAGIC comm_final.write.format("delta").mode("overwrite") \
-- MAGIC     .saveAsTable("admissions_mvp.curated.communication_activity")
-- MAGIC
-- MAGIC print(f"Total communication records written: {comm_final.count()}")
-- MAGIC
-- MAGIC # ===========================================================================
-- MAGIC # 11. Validation
-- MAGIC # ===========================================================================
-- MAGIC
-- MAGIC # 11a. Total communication count
-- MAGIC print("\n--- 11a. Total communication count ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT COUNT(*) AS total_communications
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11b. Communications by activity_type
-- MAGIC print("\n--- 11b. Communications by activity_type ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT activity_type,
-- MAGIC            COUNT(*) AS count,
-- MAGIC            ROUND(COUNT(*) * 100.0 /
-- MAGIC                 (SELECT COUNT(*) FROM admissions_mvp.curated.communication_activity), 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC     GROUP BY activity_type
-- MAGIC     ORDER BY count DESC
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11c. Communications by direction
-- MAGIC print("\n--- 11c. Communications by direction ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT direction,
-- MAGIC            COUNT(*) AS count,
-- MAGIC            ROUND(COUNT(*) * 100.0 /
-- MAGIC                 (SELECT COUNT(*) FROM admissions_mvp.curated.communication_activity), 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC     GROUP BY direction
-- MAGIC     ORDER BY count DESC
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11d. Communications by application stage outcome
-- MAGIC #      (one application per applicant to avoid fan-out)
-- MAGIC print("\n--- 11d. Communications by application stage outcome ---")
-- MAGIC spark.sql("""
-- MAGIC     WITH app_outcome AS (
-- MAGIC         SELECT applicant_id, current_status,
-- MAGIC                ROW_NUMBER() OVER (PARTITION BY applicant_id ORDER BY application_id) AS rn
-- MAGIC         FROM admissions_mvp.curated.application
-- MAGIC     )
-- MAGIC     SELECT a.current_status AS application_outcome,
-- MAGIC            COUNT(c.communication_id) AS communication_count,
-- MAGIC            ROUND(COUNT(c.communication_id) * 100.0 /
-- MAGIC                 (SELECT COUNT(*) FROM admissions_mvp.curated.communication_activity), 1) AS pct
-- MAGIC     FROM admissions_mvp.curated.communication_activity c
-- MAGIC     JOIN app_outcome a
-- MAGIC       ON c.applicant_id = a.applicant_id
-- MAGIC      AND a.rn = 1
-- MAGIC     GROUP BY a.current_status
-- MAGIC     ORDER BY communication_count DESC
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11e. Average communications per applicant
-- MAGIC print("\n--- 11e. Average communications per applicant ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT COUNT(*)                       AS total_communications,
-- MAGIC            COUNT(DISTINCT applicant_id)   AS distinct_applicants,
-- MAGIC            ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT applicant_id), 2) AS avg_comms_per_applicant
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11f. Top 20 most engaged applicants
-- MAGIC print("\n--- 11f. Top 20 engaged applicants ---")
-- MAGIC spark.sql("""
-- MAGIC     WITH app_outcome AS (
-- MAGIC         SELECT applicant_id, current_status,
-- MAGIC                ROW_NUMBER() OVER (PARTITION BY applicant_id ORDER BY application_id) AS rn
-- MAGIC         FROM admissions_mvp.curated.application
-- MAGIC     )
-- MAGIC     SELECT c.applicant_id,
-- MAGIC            COUNT(*) AS communication_count,
-- MAGIC            SUM(CASE WHEN c.direction = 'Inbound'  THEN 1 ELSE 0 END) AS inbound_count,
-- MAGIC            SUM(CASE WHEN c.direction = 'Outbound' THEN 1 ELSE 0 END) AS outbound_count,
-- MAGIC            a.current_status
-- MAGIC     FROM admissions_mvp.curated.communication_activity c
-- MAGIC     JOIN app_outcome a
-- MAGIC       ON c.applicant_id = a.applicant_id
-- MAGIC      AND a.rn = 1
-- MAGIC     GROUP BY c.applicant_id, a.current_status
-- MAGIC     ORDER BY communication_count DESC
-- MAGIC     LIMIT 20
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11g. Engagement vs enrollment conversion summary
-- MAGIC print("\n--- 11g. Engagement vs enrollment conversion summary ---")
-- MAGIC spark.sql("""
-- MAGIC     WITH applicant_comm_counts AS (
-- MAGIC         SELECT applicant_id, COUNT(*) AS comm_count
-- MAGIC         FROM admissions_mvp.curated.communication_activity
-- MAGIC         GROUP BY applicant_id
-- MAGIC     ),
-- MAGIC     app_outcomes AS (
-- MAGIC         SELECT applicant_id, current_status,
-- MAGIC                CASE
-- MAGIC                    WHEN current_status = 'Enrolled'                       THEN 'Enrolled'
-- MAGIC                    WHEN current_status IN ('Withdrawn', 'Rejected')         THEN 'Dropped Off'
-- MAGIC                    ELSE 'In Progress'
-- MAGIC                END AS outcome_bucket,
-- MAGIC                ROW_NUMBER() OVER (PARTITION BY applicant_id ORDER BY application_id) AS rn
-- MAGIC         FROM admissions_mvp.curated.application
-- MAGIC     )
-- MAGIC     SELECT o.outcome_bucket,
-- MAGIC            COUNT(DISTINCT o.applicant_id) AS applicant_count,
-- MAGIC            ROUND(AVG(cc.comm_count), 1)    AS avg_communications,
-- MAGIC            MIN(cc.comm_count)              AS min_communications,
-- MAGIC            MAX(cc.comm_count)              AS max_communications
-- MAGIC     FROM app_outcomes o
-- MAGIC     LEFT JOIN applicant_comm_counts cc
-- MAGIC       ON o.applicant_id = cc.applicant_id
-- MAGIC     WHERE o.rn = 1
-- MAGIC     GROUP BY o.outcome_bucket
-- MAGIC     ORDER BY avg_communications DESC
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11h. FK validation — no orphan applicant_ids (should be 0)
-- MAGIC print("\n--- 11h. FK validation: orphan applicant_ids (should be 0) ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT COUNT(*) AS orphan_applicant_ids
-- MAGIC     FROM admissions_mvp.curated.communication_activity c
-- MAGIC     LEFT JOIN admissions_mvp.curated.applicant ap
-- MAGIC       ON c.applicant_id = ap.applicant_id
-- MAGIC     WHERE ap.applicant_id IS NULL
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11i. Null check on mandatory columns (all should be 0)
-- MAGIC print("\n--- 11i. Null check (should be 0 for all) ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT
-- MAGIC         SUM(CASE WHEN communication_id IS NULL THEN 1 ELSE 0 END) AS null_communication_id,
-- MAGIC         SUM(CASE WHEN applicant_id     IS NULL THEN 1 ELSE 0 END) AS null_applicant_id,
-- MAGIC         SUM(CASE WHEN activity_type     IS NULL THEN 1 ELSE 0 END) AS null_activity_type,
-- MAGIC         SUM(CASE WHEN activity_date     IS NULL THEN 1 ELSE 0 END) AS null_activity_date,
-- MAGIC         SUM(CASE WHEN direction         IS NULL THEN 1 ELSE 0 END) AS null_direction
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC """).display()
-- MAGIC
-- MAGIC # 11j. Sample records
-- MAGIC print("\n--- 11j. Sample records ---")
-- MAGIC spark.sql("""
-- MAGIC     SELECT *
-- MAGIC     FROM admissions_mvp.curated.communication_activity
-- MAGIC     ORDER BY communication_id
-- MAGIC     LIMIT 20
-- MAGIC """).display()