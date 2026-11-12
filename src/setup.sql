-- 1. Organizations Table
CREATE TABLE IF NOT EXISTS public.organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- 2. Service Projects Table
CREATE TABLE IF NOT EXISTS public.project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES public.organization(organization_id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
);

-- 3. Categories Table
CREATE TABLE IF NOT EXISTS public.category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Project-Category Junction Table
CREATE TABLE IF NOT EXISTS public.project_category (
    project_id INTEGER NOT NULL REFERENCES public.project(project_id) ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES public.category(category_id) ON DELETE CASCADE,
    PRIMARY KEY (project_id, category_id)
);

-- Seed Data: Organizations
INSERT INTO public.organization (name, description, contact_email, logo_filename) VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuture.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A network of local volunteers supporting community outreach, food drives, and youth mentoring.', 'hello@unityserve.org', 'unityserve-logo.png');

-- Seed Data: Service Projects
INSERT INTO public.project (organization_id, title, description, location, project_date) VALUES
(1, 'Community Center Renovation', 'Help repair and paint the main hall of the downtown youth community center.', '120 Main St, Downtown', '2026-12-05'),
(2, 'Neighborhood Urban Garden', 'Plant seasonal vegetables and build raised garden beds for local families.', '450 Oak Ave, Westside', '2026-12-12'),
(3, 'Winter Food & Coat Drive', 'Sort, pack, and distribute warm coats and groceries to families in need.', '890 Elm Blvd, North District', '2026-12-19'),
(1, 'Solar Lighting for Park Trails', 'Install solar-powered pathway lights along the neighborhood walking trail.', '310 River Rd, East Park', '2027-01-10'),
(2, 'School Composting Workshop', 'Teach elementary students how to compost food waste and care for school plants.', '215 Maple St, Southside', '2027-01-17');

-- Seed Data: Categories
INSERT INTO public.category (name) VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

-- Seed Data: Project Categories
INSERT INTO public.project_category (project_id, category_id) VALUES
(1, 3),
(2, 1),
(2, 4),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 2);