import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = process.env.PORT || 3000;


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));


app.use(express.static(path.join(__dirname, 'public')));

const handleHomeRoute = (req, res) => {
    res.render('index', { title: 'Home' });
};

const handleOrganizationsRoute = (req, res) => {
    res.render('organizations', { title: 'Organizations' });
};

const handleProjectsRoute = (req, res) => {
    res.render('projects', { title: 'Service Projects' });
};

const handleCategoriesRoute = (req, res) => {
    res.render('categories', { title: 'Service Project Categories' });
};


app.get('/', handleHomeRoute);
app.get('/organizations', handleOrganizationsRoute);
app.get('/projects', handleProjectsRoute);
app.get('/categories', handleCategoriesRoute);


app.listen(port, () => {
    console.log(`Server is running smoothly on http://localhost:3000`);
});